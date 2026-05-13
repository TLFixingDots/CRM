import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/product_model.dart';
import '../../data/repositories/product_repository.dart';

part 'product_provider.g.dart';

@riverpod
Stream<List<Product>> products(Ref ref) async* {
  final repository = ref.watch(productRepositoryProvider);
  
  // 1. Check cache first
  final cache = await repository.getCachedProducts();
  if (cache != null) {
    yield cache;
  }
  
  // 2. Fetch fresh data
  try {
    final fresh = await repository.fetchProducts();
    yield fresh;
  } catch (e) {
    // If we already yielded cache, we might want to just stop or yield error
    // If no cache was yielded, the first yield will be the error
    if (cache == null) {
      rethrow;
    }
  }
}
