import 'dart:convert';
import 'dart:developer' as dev;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/api/api_client.dart';
import '../../../../core/api/api.dart';
import '../models/product_model.dart';

part 'product_repository.g.dart';

class ProductRepository {
  static const String _productsCacheKey = 'cached_products_list';

  Future<List<Product>?> getCachedProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedStr = prefs.getString(_productsCacheKey);
    if (cachedStr != null) {
      try {
        final List cachedList = jsonDecode(cachedStr);
        return cachedList.map((json) => Product.fromJson(json)).toList();
      } catch (e) {
        dev.log('[ProductRepository] Cache parse error: $e', name: 'flutter');
        return null;
      }
    }
    return null;
  }

  Future<List<Product>> fetchProducts() async {
    final prefs = await SharedPreferences.getInstance();
    dev.log('[ProductRepository] GET ${ApiStrings.products}', name: 'flutter');
    final response = await DioClient.get(ApiStrings.products);
    
    if (response.data['status'] == true) {
      final List result = response.data['result'];
      prefs.setString(_productsCacheKey, jsonEncode(result));
      return result.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception(response.data['message'] ?? 'Failed to fetch products');
    }
  }

  // Backward compatibility
  Future<List<Product>> getProducts() async {
    try {
      return await fetchProducts();
    } catch (e) {
      final cache = await getCachedProducts();
      if (cache != null) return cache;
      rethrow;
    }
  }
}

@riverpod
ProductRepository productRepository(Ref ref) {
  return ProductRepository();
}
