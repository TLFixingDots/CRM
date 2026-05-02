import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String brandName,
    @Default('') String category,
    @Default('') String model,
    @Default(0.0) double price,
    @Default('') String description,
    @Default('') String imageUrl,
    @Default({}) Map<String, String> specifications,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
