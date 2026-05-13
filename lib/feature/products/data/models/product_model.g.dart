// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productsId: (json['products_id'] as num).toInt(),
      bId: (json['b_id'] as num?)?.toInt(),
      pbId: (json['p_b_id'] as num?)?.toInt(),
      pCatId: (json['p_cat_id'] as num?)?.toInt(),
      taxConfigId: (json['tax_config_id'] as num?)?.toInt(),
      name: json['name'] as String,
      alias: json['alias'] as String?,
      printName: json['print_name'] as String?,
      unit: json['unit'] as String?,
      openingStockQty: json['opening_stock_qty'] as String?,
      openingStockValue: json['opening_stock_value'] as String?,
      hsnSacCode: json['hsn_sac_code'] as String?,
      salePrice: json['sale_price'] as String?,
      purchasePrice: json['purchase_price'] as String?,
      mrp: json['mrp'] as String?,
      minSalePrice: json['min_sale_price'] as String?,
      saleDiscount: json['sale_discount'] as String?,
      purchase_discount: json['purchase_discount'] as String?,
      saleMarkup: json['sale_markup'] as String?,
      purchaseMarkup: json['purchase_markup'] as String?,
      description: json['description'] as String?,
      logo: json['logo'] as String?,
      criticalLevel: (json['critical_level'] as num?)?.toInt(),
      mrpWiseDetails: (json['mrp_wise_details'] as num?)?.toInt(),
      batchWise: (json['batch_wise'] as num?)?.toInt(),
      expiryDate: json['expiry_date'],
      expiryDays: json['expiry_days'],
      taxInclusiveSale: (json['tax_inclusive_sale'] as num?)?.toInt(),
      taxInclusivePurchase: (json['tax_inclusive_purchase'] as num?)?.toInt(),
      defaultVendor: json['default_vendor'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      brand:
          json['brand'] == null
              ? null
              : ProductBrand.fromJson(json['brand'] as Map<String, dynamic>),
      category:
          json['category'] == null
              ? null
              : ProductCategory.fromJson(
                json['category'] as Map<String, dynamic>,
              ),
      tax:
          json['tax'] == null
              ? null
              : ProductTax.fromJson(json['tax'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'products_id': instance.productsId,
      'b_id': instance.bId,
      'p_b_id': instance.pbId,
      'p_cat_id': instance.pCatId,
      'tax_config_id': instance.taxConfigId,
      'name': instance.name,
      'alias': instance.alias,
      'print_name': instance.printName,
      'unit': instance.unit,
      'opening_stock_qty': instance.openingStockQty,
      'opening_stock_value': instance.openingStockValue,
      'hsn_sac_code': instance.hsnSacCode,
      'sale_price': instance.salePrice,
      'purchase_price': instance.purchasePrice,
      'mrp': instance.mrp,
      'min_sale_price': instance.minSalePrice,
      'sale_discount': instance.saleDiscount,
      'purchase_discount': instance.purchase_discount,
      'sale_markup': instance.saleMarkup,
      'purchase_markup': instance.purchaseMarkup,
      'description': instance.description,
      'logo': instance.logo,
      'critical_level': instance.criticalLevel,
      'mrp_wise_details': instance.mrpWiseDetails,
      'batch_wise': instance.batchWise,
      'expiry_date': instance.expiryDate,
      'expiry_days': instance.expiryDays,
      'tax_inclusive_sale': instance.taxInclusiveSale,
      'tax_inclusive_purchase': instance.taxInclusivePurchase,
      'default_vendor': instance.defaultVendor,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'brand': instance.brand,
      'category': instance.category,
      'tax': instance.tax,
    };

_$ProductBrandImpl _$$ProductBrandImplFromJson(Map<String, dynamic> json) =>
    _$ProductBrandImpl(
      pbId: (json['pb_id'] as num?)?.toInt(),
      bId: (json['b_id'] as num?)?.toInt(),
      name: json['name'] as String,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$ProductBrandImplToJson(_$ProductBrandImpl instance) =>
    <String, dynamic>{
      'pb_id': instance.pbId,
      'b_id': instance.bId,
      'name': instance.name,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$ProductCategoryImpl _$$ProductCategoryImplFromJson(
  Map<String, dynamic> json,
) => _$ProductCategoryImpl(
  pcId: (json['pc_id'] as num?)?.toInt(),
  pbId: (json['p_b_id'] as num?)?.toInt(),
  bId: (json['b_id'] as num?)?.toInt(),
  name: json['name'] as String,
  status: (json['status'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$$ProductCategoryImplToJson(
  _$ProductCategoryImpl instance,
) => <String, dynamic>{
  'pc_id': instance.pcId,
  'p_b_id': instance.pbId,
  'b_id': instance.bId,
  'name': instance.name,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

_$ProductTaxImpl _$$ProductTaxImplFromJson(Map<String, dynamic> json) =>
    _$ProductTaxImpl(
      tcId: (json['tc_id'] as num?)?.toInt(),
      bId: (json['b_id'] as num?)?.toInt(),
      name: json['name'] as String,
      value: json['value'] as String?,
      split: (json['split'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$ProductTaxImplToJson(_$ProductTaxImpl instance) =>
    <String, dynamic>{
      'tc_id': instance.tcId,
      'b_id': instance.bId,
      'name': instance.name,
      'value': instance.value,
      'split': instance.split,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
