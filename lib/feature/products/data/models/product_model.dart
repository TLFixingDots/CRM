import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  const Product._();

  const factory Product({
    @JsonKey(name: 'products_id') required int productsId,
    @JsonKey(name: 'b_id') int? bId,
    @JsonKey(name: 'p_b_id') int? pbId,
    @JsonKey(name: 'p_cat_id') int? pCatId,
    @JsonKey(name: 'tax_config_id') int? taxConfigId,
    required String name,
    String? alias,
    @JsonKey(name: 'print_name') String? printName,
    String? unit,
    @JsonKey(name: 'opening_stock_qty') String? openingStockQty,
    @JsonKey(name: 'opening_stock_value') String? openingStockValue,
    @JsonKey(name: 'hsn_sac_code') String? hsnSacCode,
    @JsonKey(name: 'sale_price') String? salePrice,
    @JsonKey(name: 'purchase_price') String? purchasePrice,
    String? mrp,
    @JsonKey(name: 'min_sale_price') String? minSalePrice,
    @JsonKey(name: 'sale_discount') String? saleDiscount,
    @JsonKey(name: 'purchase_discount') String? purchase_discount,
    @JsonKey(name: 'sale_markup') String? saleMarkup,
    @JsonKey(name: 'purchase_markup') String? purchaseMarkup,
    String? description,
    String? logo,
    @JsonKey(name: 'critical_level') int? criticalLevel,
    @JsonKey(name: 'mrp_wise_details') int? mrpWiseDetails,
    @JsonKey(name: 'batch_wise') int? batchWise,
    @JsonKey(name: 'expiry_date') dynamic expiryDate,
    @JsonKey(name: 'expiry_days') dynamic expiryDays,
    @JsonKey(name: 'tax_inclusive_sale') int? taxInclusiveSale,
    @JsonKey(name: 'tax_inclusive_purchase') int? taxInclusivePurchase,
    @JsonKey(name: 'default_vendor') String? defaultVendor,
    @JsonKey(name: 'is_active') int? isActive,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    ProductBrand? brand,
    ProductCategory? category,
    ProductTax? tax,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  String? get fullLogoUrl {
    if (logo == null || logo!.isEmpty) return null;
    return 'https://uat.fixcrm.app/public/uploads/products/$logo';
  }
}

@freezed
class ProductBrand with _$ProductBrand {
  const factory ProductBrand({
    @JsonKey(name: 'pb_id') int? pbId,
    @JsonKey(name: 'b_id') int? bId,
    required String name,
    int? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ProductBrand;

  factory ProductBrand.fromJson(Map<String, dynamic> json) => _$ProductBrandFromJson(json);
}

@freezed
class ProductCategory with _$ProductCategory {
  const factory ProductCategory({
    @JsonKey(name: 'pc_id') int? pcId,
    @JsonKey(name: 'p_b_id') int? pbId,
    @JsonKey(name: 'b_id') int? bId,
    required String name,
    int? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ProductCategory;

  factory ProductCategory.fromJson(Map<String, dynamic> json) => _$ProductCategoryFromJson(json);
}

@freezed
class ProductTax with _$ProductTax {
  const factory ProductTax({
    @JsonKey(name: 'tc_id') int? tcId,
    @JsonKey(name: 'b_id') int? bId,
    required String name,
    String? value,
    int? split,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ProductTax;

  factory ProductTax.fromJson(Map<String, dynamic> json) => _$ProductTaxFromJson(json);
}
