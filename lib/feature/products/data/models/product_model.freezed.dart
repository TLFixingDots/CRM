// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: 'products_id')
  int get productsId => throw _privateConstructorUsedError;
  @JsonKey(name: 'b_id')
  int? get bId => throw _privateConstructorUsedError;
  @JsonKey(name: 'p_b_id')
  int? get pbId => throw _privateConstructorUsedError;
  @JsonKey(name: 'p_cat_id')
  int? get pCatId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_config_id')
  int? get taxConfigId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get alias => throw _privateConstructorUsedError;
  @JsonKey(name: 'print_name')
  String? get printName => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_stock_qty')
  String? get openingStockQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_stock_value')
  String? get openingStockValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'hsn_sac_code')
  String? get hsnSacCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_price')
  String? get salePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_price')
  String? get purchasePrice => throw _privateConstructorUsedError;
  String? get mrp => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_sale_price')
  String? get minSalePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_discount')
  String? get saleDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_discount')
  String? get purchase_discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_markup')
  String? get saleMarkup => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_markup')
  String? get purchaseMarkup => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'critical_level')
  int? get criticalLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'mrp_wise_details')
  int? get mrpWiseDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_wise')
  int? get batchWise => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry_date')
  dynamic get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry_days')
  dynamic get expiryDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_inclusive_sale')
  int? get taxInclusiveSale => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_inclusive_purchase')
  int? get taxInclusivePurchase => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_vendor')
  String? get defaultVendor => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  int? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  ProductBrand? get brand => throw _privateConstructorUsedError;
  ProductCategory? get category => throw _privateConstructorUsedError;
  ProductTax? get tax => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call({
    @JsonKey(name: 'products_id') int productsId,
    @JsonKey(name: 'b_id') int? bId,
    @JsonKey(name: 'p_b_id') int? pbId,
    @JsonKey(name: 'p_cat_id') int? pCatId,
    @JsonKey(name: 'tax_config_id') int? taxConfigId,
    String name,
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
  });

  $ProductBrandCopyWith<$Res>? get brand;
  $ProductCategoryCopyWith<$Res>? get category;
  $ProductTaxCopyWith<$Res>? get tax;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsId = null,
    Object? bId = freezed,
    Object? pbId = freezed,
    Object? pCatId = freezed,
    Object? taxConfigId = freezed,
    Object? name = null,
    Object? alias = freezed,
    Object? printName = freezed,
    Object? unit = freezed,
    Object? openingStockQty = freezed,
    Object? openingStockValue = freezed,
    Object? hsnSacCode = freezed,
    Object? salePrice = freezed,
    Object? purchasePrice = freezed,
    Object? mrp = freezed,
    Object? minSalePrice = freezed,
    Object? saleDiscount = freezed,
    Object? purchase_discount = freezed,
    Object? saleMarkup = freezed,
    Object? purchaseMarkup = freezed,
    Object? description = freezed,
    Object? logo = freezed,
    Object? criticalLevel = freezed,
    Object? mrpWiseDetails = freezed,
    Object? batchWise = freezed,
    Object? expiryDate = freezed,
    Object? expiryDays = freezed,
    Object? taxInclusiveSale = freezed,
    Object? taxInclusivePurchase = freezed,
    Object? defaultVendor = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? brand = freezed,
    Object? category = freezed,
    Object? tax = freezed,
  }) {
    return _then(
      _value.copyWith(
            productsId:
                null == productsId
                    ? _value.productsId
                    : productsId // ignore: cast_nullable_to_non_nullable
                        as int,
            bId:
                freezed == bId
                    ? _value.bId
                    : bId // ignore: cast_nullable_to_non_nullable
                        as int?,
            pbId:
                freezed == pbId
                    ? _value.pbId
                    : pbId // ignore: cast_nullable_to_non_nullable
                        as int?,
            pCatId:
                freezed == pCatId
                    ? _value.pCatId
                    : pCatId // ignore: cast_nullable_to_non_nullable
                        as int?,
            taxConfigId:
                freezed == taxConfigId
                    ? _value.taxConfigId
                    : taxConfigId // ignore: cast_nullable_to_non_nullable
                        as int?,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            alias:
                freezed == alias
                    ? _value.alias
                    : alias // ignore: cast_nullable_to_non_nullable
                        as String?,
            printName:
                freezed == printName
                    ? _value.printName
                    : printName // ignore: cast_nullable_to_non_nullable
                        as String?,
            unit:
                freezed == unit
                    ? _value.unit
                    : unit // ignore: cast_nullable_to_non_nullable
                        as String?,
            openingStockQty:
                freezed == openingStockQty
                    ? _value.openingStockQty
                    : openingStockQty // ignore: cast_nullable_to_non_nullable
                        as String?,
            openingStockValue:
                freezed == openingStockValue
                    ? _value.openingStockValue
                    : openingStockValue // ignore: cast_nullable_to_non_nullable
                        as String?,
            hsnSacCode:
                freezed == hsnSacCode
                    ? _value.hsnSacCode
                    : hsnSacCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            salePrice:
                freezed == salePrice
                    ? _value.salePrice
                    : salePrice // ignore: cast_nullable_to_non_nullable
                        as String?,
            purchasePrice:
                freezed == purchasePrice
                    ? _value.purchasePrice
                    : purchasePrice // ignore: cast_nullable_to_non_nullable
                        as String?,
            mrp:
                freezed == mrp
                    ? _value.mrp
                    : mrp // ignore: cast_nullable_to_non_nullable
                        as String?,
            minSalePrice:
                freezed == minSalePrice
                    ? _value.minSalePrice
                    : minSalePrice // ignore: cast_nullable_to_non_nullable
                        as String?,
            saleDiscount:
                freezed == saleDiscount
                    ? _value.saleDiscount
                    : saleDiscount // ignore: cast_nullable_to_non_nullable
                        as String?,
            purchase_discount:
                freezed == purchase_discount
                    ? _value.purchase_discount
                    : purchase_discount // ignore: cast_nullable_to_non_nullable
                        as String?,
            saleMarkup:
                freezed == saleMarkup
                    ? _value.saleMarkup
                    : saleMarkup // ignore: cast_nullable_to_non_nullable
                        as String?,
            purchaseMarkup:
                freezed == purchaseMarkup
                    ? _value.purchaseMarkup
                    : purchaseMarkup // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            logo:
                freezed == logo
                    ? _value.logo
                    : logo // ignore: cast_nullable_to_non_nullable
                        as String?,
            criticalLevel:
                freezed == criticalLevel
                    ? _value.criticalLevel
                    : criticalLevel // ignore: cast_nullable_to_non_nullable
                        as int?,
            mrpWiseDetails:
                freezed == mrpWiseDetails
                    ? _value.mrpWiseDetails
                    : mrpWiseDetails // ignore: cast_nullable_to_non_nullable
                        as int?,
            batchWise:
                freezed == batchWise
                    ? _value.batchWise
                    : batchWise // ignore: cast_nullable_to_non_nullable
                        as int?,
            expiryDate:
                freezed == expiryDate
                    ? _value.expiryDate
                    : expiryDate // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            expiryDays:
                freezed == expiryDays
                    ? _value.expiryDays
                    : expiryDays // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            taxInclusiveSale:
                freezed == taxInclusiveSale
                    ? _value.taxInclusiveSale
                    : taxInclusiveSale // ignore: cast_nullable_to_non_nullable
                        as int?,
            taxInclusivePurchase:
                freezed == taxInclusivePurchase
                    ? _value.taxInclusivePurchase
                    : taxInclusivePurchase // ignore: cast_nullable_to_non_nullable
                        as int?,
            defaultVendor:
                freezed == defaultVendor
                    ? _value.defaultVendor
                    : defaultVendor // ignore: cast_nullable_to_non_nullable
                        as String?,
            isActive:
                freezed == isActive
                    ? _value.isActive
                    : isActive // ignore: cast_nullable_to_non_nullable
                        as int?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            brand:
                freezed == brand
                    ? _value.brand
                    : brand // ignore: cast_nullable_to_non_nullable
                        as ProductBrand?,
            category:
                freezed == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as ProductCategory?,
            tax:
                freezed == tax
                    ? _value.tax
                    : tax // ignore: cast_nullable_to_non_nullable
                        as ProductTax?,
          )
          as $Val,
    );
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductBrandCopyWith<$Res>? get brand {
    if (_value.brand == null) {
      return null;
    }

    return $ProductBrandCopyWith<$Res>(_value.brand!, (value) {
      return _then(_value.copyWith(brand: value) as $Val);
    });
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $ProductCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductTaxCopyWith<$Res>? get tax {
    if (_value.tax == null) {
      return null;
    }

    return $ProductTaxCopyWith<$Res>(_value.tax!, (value) {
      return _then(_value.copyWith(tax: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
    _$ProductImpl value,
    $Res Function(_$ProductImpl) then,
  ) = __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'products_id') int productsId,
    @JsonKey(name: 'b_id') int? bId,
    @JsonKey(name: 'p_b_id') int? pbId,
    @JsonKey(name: 'p_cat_id') int? pCatId,
    @JsonKey(name: 'tax_config_id') int? taxConfigId,
    String name,
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
  });

  @override
  $ProductBrandCopyWith<$Res>? get brand;
  @override
  $ProductCategoryCopyWith<$Res>? get category;
  @override
  $ProductTaxCopyWith<$Res>? get tax;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
    _$ProductImpl _value,
    $Res Function(_$ProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsId = null,
    Object? bId = freezed,
    Object? pbId = freezed,
    Object? pCatId = freezed,
    Object? taxConfigId = freezed,
    Object? name = null,
    Object? alias = freezed,
    Object? printName = freezed,
    Object? unit = freezed,
    Object? openingStockQty = freezed,
    Object? openingStockValue = freezed,
    Object? hsnSacCode = freezed,
    Object? salePrice = freezed,
    Object? purchasePrice = freezed,
    Object? mrp = freezed,
    Object? minSalePrice = freezed,
    Object? saleDiscount = freezed,
    Object? purchase_discount = freezed,
    Object? saleMarkup = freezed,
    Object? purchaseMarkup = freezed,
    Object? description = freezed,
    Object? logo = freezed,
    Object? criticalLevel = freezed,
    Object? mrpWiseDetails = freezed,
    Object? batchWise = freezed,
    Object? expiryDate = freezed,
    Object? expiryDays = freezed,
    Object? taxInclusiveSale = freezed,
    Object? taxInclusivePurchase = freezed,
    Object? defaultVendor = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? brand = freezed,
    Object? category = freezed,
    Object? tax = freezed,
  }) {
    return _then(
      _$ProductImpl(
        productsId:
            null == productsId
                ? _value.productsId
                : productsId // ignore: cast_nullable_to_non_nullable
                    as int,
        bId:
            freezed == bId
                ? _value.bId
                : bId // ignore: cast_nullable_to_non_nullable
                    as int?,
        pbId:
            freezed == pbId
                ? _value.pbId
                : pbId // ignore: cast_nullable_to_non_nullable
                    as int?,
        pCatId:
            freezed == pCatId
                ? _value.pCatId
                : pCatId // ignore: cast_nullable_to_non_nullable
                    as int?,
        taxConfigId:
            freezed == taxConfigId
                ? _value.taxConfigId
                : taxConfigId // ignore: cast_nullable_to_non_nullable
                    as int?,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        alias:
            freezed == alias
                ? _value.alias
                : alias // ignore: cast_nullable_to_non_nullable
                    as String?,
        printName:
            freezed == printName
                ? _value.printName
                : printName // ignore: cast_nullable_to_non_nullable
                    as String?,
        unit:
            freezed == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                    as String?,
        openingStockQty:
            freezed == openingStockQty
                ? _value.openingStockQty
                : openingStockQty // ignore: cast_nullable_to_non_nullable
                    as String?,
        openingStockValue:
            freezed == openingStockValue
                ? _value.openingStockValue
                : openingStockValue // ignore: cast_nullable_to_non_nullable
                    as String?,
        hsnSacCode:
            freezed == hsnSacCode
                ? _value.hsnSacCode
                : hsnSacCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        salePrice:
            freezed == salePrice
                ? _value.salePrice
                : salePrice // ignore: cast_nullable_to_non_nullable
                    as String?,
        purchasePrice:
            freezed == purchasePrice
                ? _value.purchasePrice
                : purchasePrice // ignore: cast_nullable_to_non_nullable
                    as String?,
        mrp:
            freezed == mrp
                ? _value.mrp
                : mrp // ignore: cast_nullable_to_non_nullable
                    as String?,
        minSalePrice:
            freezed == minSalePrice
                ? _value.minSalePrice
                : minSalePrice // ignore: cast_nullable_to_non_nullable
                    as String?,
        saleDiscount:
            freezed == saleDiscount
                ? _value.saleDiscount
                : saleDiscount // ignore: cast_nullable_to_non_nullable
                    as String?,
        purchase_discount:
            freezed == purchase_discount
                ? _value.purchase_discount
                : purchase_discount // ignore: cast_nullable_to_non_nullable
                    as String?,
        saleMarkup:
            freezed == saleMarkup
                ? _value.saleMarkup
                : saleMarkup // ignore: cast_nullable_to_non_nullable
                    as String?,
        purchaseMarkup:
            freezed == purchaseMarkup
                ? _value.purchaseMarkup
                : purchaseMarkup // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        logo:
            freezed == logo
                ? _value.logo
                : logo // ignore: cast_nullable_to_non_nullable
                    as String?,
        criticalLevel:
            freezed == criticalLevel
                ? _value.criticalLevel
                : criticalLevel // ignore: cast_nullable_to_non_nullable
                    as int?,
        mrpWiseDetails:
            freezed == mrpWiseDetails
                ? _value.mrpWiseDetails
                : mrpWiseDetails // ignore: cast_nullable_to_non_nullable
                    as int?,
        batchWise:
            freezed == batchWise
                ? _value.batchWise
                : batchWise // ignore: cast_nullable_to_non_nullable
                    as int?,
        expiryDate:
            freezed == expiryDate
                ? _value.expiryDate
                : expiryDate // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        expiryDays:
            freezed == expiryDays
                ? _value.expiryDays
                : expiryDays // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        taxInclusiveSale:
            freezed == taxInclusiveSale
                ? _value.taxInclusiveSale
                : taxInclusiveSale // ignore: cast_nullable_to_non_nullable
                    as int?,
        taxInclusivePurchase:
            freezed == taxInclusivePurchase
                ? _value.taxInclusivePurchase
                : taxInclusivePurchase // ignore: cast_nullable_to_non_nullable
                    as int?,
        defaultVendor:
            freezed == defaultVendor
                ? _value.defaultVendor
                : defaultVendor // ignore: cast_nullable_to_non_nullable
                    as String?,
        isActive:
            freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                    as int?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        brand:
            freezed == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                    as ProductBrand?,
        category:
            freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as ProductCategory?,
        tax:
            freezed == tax
                ? _value.tax
                : tax // ignore: cast_nullable_to_non_nullable
                    as ProductTax?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl extends _Product {
  const _$ProductImpl({
    @JsonKey(name: 'products_id') required this.productsId,
    @JsonKey(name: 'b_id') this.bId,
    @JsonKey(name: 'p_b_id') this.pbId,
    @JsonKey(name: 'p_cat_id') this.pCatId,
    @JsonKey(name: 'tax_config_id') this.taxConfigId,
    required this.name,
    this.alias,
    @JsonKey(name: 'print_name') this.printName,
    this.unit,
    @JsonKey(name: 'opening_stock_qty') this.openingStockQty,
    @JsonKey(name: 'opening_stock_value') this.openingStockValue,
    @JsonKey(name: 'hsn_sac_code') this.hsnSacCode,
    @JsonKey(name: 'sale_price') this.salePrice,
    @JsonKey(name: 'purchase_price') this.purchasePrice,
    this.mrp,
    @JsonKey(name: 'min_sale_price') this.minSalePrice,
    @JsonKey(name: 'sale_discount') this.saleDiscount,
    @JsonKey(name: 'purchase_discount') this.purchase_discount,
    @JsonKey(name: 'sale_markup') this.saleMarkup,
    @JsonKey(name: 'purchase_markup') this.purchaseMarkup,
    this.description,
    this.logo,
    @JsonKey(name: 'critical_level') this.criticalLevel,
    @JsonKey(name: 'mrp_wise_details') this.mrpWiseDetails,
    @JsonKey(name: 'batch_wise') this.batchWise,
    @JsonKey(name: 'expiry_date') this.expiryDate,
    @JsonKey(name: 'expiry_days') this.expiryDays,
    @JsonKey(name: 'tax_inclusive_sale') this.taxInclusiveSale,
    @JsonKey(name: 'tax_inclusive_purchase') this.taxInclusivePurchase,
    @JsonKey(name: 'default_vendor') this.defaultVendor,
    @JsonKey(name: 'is_active') this.isActive,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    this.brand,
    this.category,
    this.tax,
  }) : super._();

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: 'products_id')
  final int productsId;
  @override
  @JsonKey(name: 'b_id')
  final int? bId;
  @override
  @JsonKey(name: 'p_b_id')
  final int? pbId;
  @override
  @JsonKey(name: 'p_cat_id')
  final int? pCatId;
  @override
  @JsonKey(name: 'tax_config_id')
  final int? taxConfigId;
  @override
  final String name;
  @override
  final String? alias;
  @override
  @JsonKey(name: 'print_name')
  final String? printName;
  @override
  final String? unit;
  @override
  @JsonKey(name: 'opening_stock_qty')
  final String? openingStockQty;
  @override
  @JsonKey(name: 'opening_stock_value')
  final String? openingStockValue;
  @override
  @JsonKey(name: 'hsn_sac_code')
  final String? hsnSacCode;
  @override
  @JsonKey(name: 'sale_price')
  final String? salePrice;
  @override
  @JsonKey(name: 'purchase_price')
  final String? purchasePrice;
  @override
  final String? mrp;
  @override
  @JsonKey(name: 'min_sale_price')
  final String? minSalePrice;
  @override
  @JsonKey(name: 'sale_discount')
  final String? saleDiscount;
  @override
  @JsonKey(name: 'purchase_discount')
  final String? purchase_discount;
  @override
  @JsonKey(name: 'sale_markup')
  final String? saleMarkup;
  @override
  @JsonKey(name: 'purchase_markup')
  final String? purchaseMarkup;
  @override
  final String? description;
  @override
  final String? logo;
  @override
  @JsonKey(name: 'critical_level')
  final int? criticalLevel;
  @override
  @JsonKey(name: 'mrp_wise_details')
  final int? mrpWiseDetails;
  @override
  @JsonKey(name: 'batch_wise')
  final int? batchWise;
  @override
  @JsonKey(name: 'expiry_date')
  final dynamic expiryDate;
  @override
  @JsonKey(name: 'expiry_days')
  final dynamic expiryDays;
  @override
  @JsonKey(name: 'tax_inclusive_sale')
  final int? taxInclusiveSale;
  @override
  @JsonKey(name: 'tax_inclusive_purchase')
  final int? taxInclusivePurchase;
  @override
  @JsonKey(name: 'default_vendor')
  final String? defaultVendor;
  @override
  @JsonKey(name: 'is_active')
  final int? isActive;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  final ProductBrand? brand;
  @override
  final ProductCategory? category;
  @override
  final ProductTax? tax;

  @override
  String toString() {
    return 'Product(productsId: $productsId, bId: $bId, pbId: $pbId, pCatId: $pCatId, taxConfigId: $taxConfigId, name: $name, alias: $alias, printName: $printName, unit: $unit, openingStockQty: $openingStockQty, openingStockValue: $openingStockValue, hsnSacCode: $hsnSacCode, salePrice: $salePrice, purchasePrice: $purchasePrice, mrp: $mrp, minSalePrice: $minSalePrice, saleDiscount: $saleDiscount, purchase_discount: $purchase_discount, saleMarkup: $saleMarkup, purchaseMarkup: $purchaseMarkup, description: $description, logo: $logo, criticalLevel: $criticalLevel, mrpWiseDetails: $mrpWiseDetails, batchWise: $batchWise, expiryDate: $expiryDate, expiryDays: $expiryDays, taxInclusiveSale: $taxInclusiveSale, taxInclusivePurchase: $taxInclusivePurchase, defaultVendor: $defaultVendor, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, brand: $brand, category: $category, tax: $tax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.productsId, productsId) ||
                other.productsId == productsId) &&
            (identical(other.bId, bId) || other.bId == bId) &&
            (identical(other.pbId, pbId) || other.pbId == pbId) &&
            (identical(other.pCatId, pCatId) || other.pCatId == pCatId) &&
            (identical(other.taxConfigId, taxConfigId) ||
                other.taxConfigId == taxConfigId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.alias, alias) || other.alias == alias) &&
            (identical(other.printName, printName) ||
                other.printName == printName) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.openingStockQty, openingStockQty) ||
                other.openingStockQty == openingStockQty) &&
            (identical(other.openingStockValue, openingStockValue) ||
                other.openingStockValue == openingStockValue) &&
            (identical(other.hsnSacCode, hsnSacCode) ||
                other.hsnSacCode == hsnSacCode) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.minSalePrice, minSalePrice) ||
                other.minSalePrice == minSalePrice) &&
            (identical(other.saleDiscount, saleDiscount) ||
                other.saleDiscount == saleDiscount) &&
            (identical(other.purchase_discount, purchase_discount) ||
                other.purchase_discount == purchase_discount) &&
            (identical(other.saleMarkup, saleMarkup) ||
                other.saleMarkup == saleMarkup) &&
            (identical(other.purchaseMarkup, purchaseMarkup) ||
                other.purchaseMarkup == purchaseMarkup) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.criticalLevel, criticalLevel) ||
                other.criticalLevel == criticalLevel) &&
            (identical(other.mrpWiseDetails, mrpWiseDetails) ||
                other.mrpWiseDetails == mrpWiseDetails) &&
            (identical(other.batchWise, batchWise) ||
                other.batchWise == batchWise) &&
            const DeepCollectionEquality().equals(
              other.expiryDate,
              expiryDate,
            ) &&
            const DeepCollectionEquality().equals(
              other.expiryDays,
              expiryDays,
            ) &&
            (identical(other.taxInclusiveSale, taxInclusiveSale) ||
                other.taxInclusiveSale == taxInclusiveSale) &&
            (identical(other.taxInclusivePurchase, taxInclusivePurchase) ||
                other.taxInclusivePurchase == taxInclusivePurchase) &&
            (identical(other.defaultVendor, defaultVendor) ||
                other.defaultVendor == defaultVendor) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.tax, tax) || other.tax == tax));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    productsId,
    bId,
    pbId,
    pCatId,
    taxConfigId,
    name,
    alias,
    printName,
    unit,
    openingStockQty,
    openingStockValue,
    hsnSacCode,
    salePrice,
    purchasePrice,
    mrp,
    minSalePrice,
    saleDiscount,
    purchase_discount,
    saleMarkup,
    purchaseMarkup,
    description,
    logo,
    criticalLevel,
    mrpWiseDetails,
    batchWise,
    const DeepCollectionEquality().hash(expiryDate),
    const DeepCollectionEquality().hash(expiryDays),
    taxInclusiveSale,
    taxInclusivePurchase,
    defaultVendor,
    isActive,
    createdAt,
    updatedAt,
    brand,
    category,
    tax,
  ]);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(this);
  }
}

abstract class _Product extends Product {
  const factory _Product({
    @JsonKey(name: 'products_id') required final int productsId,
    @JsonKey(name: 'b_id') final int? bId,
    @JsonKey(name: 'p_b_id') final int? pbId,
    @JsonKey(name: 'p_cat_id') final int? pCatId,
    @JsonKey(name: 'tax_config_id') final int? taxConfigId,
    required final String name,
    final String? alias,
    @JsonKey(name: 'print_name') final String? printName,
    final String? unit,
    @JsonKey(name: 'opening_stock_qty') final String? openingStockQty,
    @JsonKey(name: 'opening_stock_value') final String? openingStockValue,
    @JsonKey(name: 'hsn_sac_code') final String? hsnSacCode,
    @JsonKey(name: 'sale_price') final String? salePrice,
    @JsonKey(name: 'purchase_price') final String? purchasePrice,
    final String? mrp,
    @JsonKey(name: 'min_sale_price') final String? minSalePrice,
    @JsonKey(name: 'sale_discount') final String? saleDiscount,
    @JsonKey(name: 'purchase_discount') final String? purchase_discount,
    @JsonKey(name: 'sale_markup') final String? saleMarkup,
    @JsonKey(name: 'purchase_markup') final String? purchaseMarkup,
    final String? description,
    final String? logo,
    @JsonKey(name: 'critical_level') final int? criticalLevel,
    @JsonKey(name: 'mrp_wise_details') final int? mrpWiseDetails,
    @JsonKey(name: 'batch_wise') final int? batchWise,
    @JsonKey(name: 'expiry_date') final dynamic expiryDate,
    @JsonKey(name: 'expiry_days') final dynamic expiryDays,
    @JsonKey(name: 'tax_inclusive_sale') final int? taxInclusiveSale,
    @JsonKey(name: 'tax_inclusive_purchase') final int? taxInclusivePurchase,
    @JsonKey(name: 'default_vendor') final String? defaultVendor,
    @JsonKey(name: 'is_active') final int? isActive,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
    final ProductBrand? brand,
    final ProductCategory? category,
    final ProductTax? tax,
  }) = _$ProductImpl;
  const _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(name: 'products_id')
  int get productsId;
  @override
  @JsonKey(name: 'b_id')
  int? get bId;
  @override
  @JsonKey(name: 'p_b_id')
  int? get pbId;
  @override
  @JsonKey(name: 'p_cat_id')
  int? get pCatId;
  @override
  @JsonKey(name: 'tax_config_id')
  int? get taxConfigId;
  @override
  String get name;
  @override
  String? get alias;
  @override
  @JsonKey(name: 'print_name')
  String? get printName;
  @override
  String? get unit;
  @override
  @JsonKey(name: 'opening_stock_qty')
  String? get openingStockQty;
  @override
  @JsonKey(name: 'opening_stock_value')
  String? get openingStockValue;
  @override
  @JsonKey(name: 'hsn_sac_code')
  String? get hsnSacCode;
  @override
  @JsonKey(name: 'sale_price')
  String? get salePrice;
  @override
  @JsonKey(name: 'purchase_price')
  String? get purchasePrice;
  @override
  String? get mrp;
  @override
  @JsonKey(name: 'min_sale_price')
  String? get minSalePrice;
  @override
  @JsonKey(name: 'sale_discount')
  String? get saleDiscount;
  @override
  @JsonKey(name: 'purchase_discount')
  String? get purchase_discount;
  @override
  @JsonKey(name: 'sale_markup')
  String? get saleMarkup;
  @override
  @JsonKey(name: 'purchase_markup')
  String? get purchaseMarkup;
  @override
  String? get description;
  @override
  String? get logo;
  @override
  @JsonKey(name: 'critical_level')
  int? get criticalLevel;
  @override
  @JsonKey(name: 'mrp_wise_details')
  int? get mrpWiseDetails;
  @override
  @JsonKey(name: 'batch_wise')
  int? get batchWise;
  @override
  @JsonKey(name: 'expiry_date')
  dynamic get expiryDate;
  @override
  @JsonKey(name: 'expiry_days')
  dynamic get expiryDays;
  @override
  @JsonKey(name: 'tax_inclusive_sale')
  int? get taxInclusiveSale;
  @override
  @JsonKey(name: 'tax_inclusive_purchase')
  int? get taxInclusivePurchase;
  @override
  @JsonKey(name: 'default_vendor')
  String? get defaultVendor;
  @override
  @JsonKey(name: 'is_active')
  int? get isActive;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  ProductBrand? get brand;
  @override
  ProductCategory? get category;
  @override
  ProductTax? get tax;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductBrand _$ProductBrandFromJson(Map<String, dynamic> json) {
  return _ProductBrand.fromJson(json);
}

/// @nodoc
mixin _$ProductBrand {
  @JsonKey(name: 'pb_id')
  int? get pbId => throw _privateConstructorUsedError;
  @JsonKey(name: 'b_id')
  int? get bId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductBrand to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductBrand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductBrandCopyWith<ProductBrand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductBrandCopyWith<$Res> {
  factory $ProductBrandCopyWith(
    ProductBrand value,
    $Res Function(ProductBrand) then,
  ) = _$ProductBrandCopyWithImpl<$Res, ProductBrand>;
  @useResult
  $Res call({
    @JsonKey(name: 'pb_id') int? pbId,
    @JsonKey(name: 'b_id') int? bId,
    String name,
    int? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class _$ProductBrandCopyWithImpl<$Res, $Val extends ProductBrand>
    implements $ProductBrandCopyWith<$Res> {
  _$ProductBrandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductBrand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pbId = freezed,
    Object? bId = freezed,
    Object? name = null,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            pbId:
                freezed == pbId
                    ? _value.pbId
                    : pbId // ignore: cast_nullable_to_non_nullable
                        as int?,
            bId:
                freezed == bId
                    ? _value.bId
                    : bId // ignore: cast_nullable_to_non_nullable
                        as int?,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as int?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductBrandImplCopyWith<$Res>
    implements $ProductBrandCopyWith<$Res> {
  factory _$$ProductBrandImplCopyWith(
    _$ProductBrandImpl value,
    $Res Function(_$ProductBrandImpl) then,
  ) = __$$ProductBrandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'pb_id') int? pbId,
    @JsonKey(name: 'b_id') int? bId,
    String name,
    int? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class __$$ProductBrandImplCopyWithImpl<$Res>
    extends _$ProductBrandCopyWithImpl<$Res, _$ProductBrandImpl>
    implements _$$ProductBrandImplCopyWith<$Res> {
  __$$ProductBrandImplCopyWithImpl(
    _$ProductBrandImpl _value,
    $Res Function(_$ProductBrandImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductBrand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pbId = freezed,
    Object? bId = freezed,
    Object? name = null,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ProductBrandImpl(
        pbId:
            freezed == pbId
                ? _value.pbId
                : pbId // ignore: cast_nullable_to_non_nullable
                    as int?,
        bId:
            freezed == bId
                ? _value.bId
                : bId // ignore: cast_nullable_to_non_nullable
                    as int?,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as int?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductBrandImpl implements _ProductBrand {
  const _$ProductBrandImpl({
    @JsonKey(name: 'pb_id') this.pbId,
    @JsonKey(name: 'b_id') this.bId,
    required this.name,
    this.status,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  });

  factory _$ProductBrandImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductBrandImplFromJson(json);

  @override
  @JsonKey(name: 'pb_id')
  final int? pbId;
  @override
  @JsonKey(name: 'b_id')
  final int? bId;
  @override
  final String name;
  @override
  final int? status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'ProductBrand(pbId: $pbId, bId: $bId, name: $name, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductBrandImpl &&
            (identical(other.pbId, pbId) || other.pbId == pbId) &&
            (identical(other.bId, bId) || other.bId == bId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pbId, bId, name, status, createdAt, updatedAt);

  /// Create a copy of ProductBrand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductBrandImplCopyWith<_$ProductBrandImpl> get copyWith =>
      __$$ProductBrandImplCopyWithImpl<_$ProductBrandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductBrandImplToJson(this);
  }
}

abstract class _ProductBrand implements ProductBrand {
  const factory _ProductBrand({
    @JsonKey(name: 'pb_id') final int? pbId,
    @JsonKey(name: 'b_id') final int? bId,
    required final String name,
    final int? status,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
  }) = _$ProductBrandImpl;

  factory _ProductBrand.fromJson(Map<String, dynamic> json) =
      _$ProductBrandImpl.fromJson;

  @override
  @JsonKey(name: 'pb_id')
  int? get pbId;
  @override
  @JsonKey(name: 'b_id')
  int? get bId;
  @override
  String get name;
  @override
  int? get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of ProductBrand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductBrandImplCopyWith<_$ProductBrandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) {
  return _ProductCategory.fromJson(json);
}

/// @nodoc
mixin _$ProductCategory {
  @JsonKey(name: 'pc_id')
  int? get pcId => throw _privateConstructorUsedError;
  @JsonKey(name: 'p_b_id')
  int? get pbId => throw _privateConstructorUsedError;
  @JsonKey(name: 'b_id')
  int? get bId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCategoryCopyWith<ProductCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoryCopyWith<$Res> {
  factory $ProductCategoryCopyWith(
    ProductCategory value,
    $Res Function(ProductCategory) then,
  ) = _$ProductCategoryCopyWithImpl<$Res, ProductCategory>;
  @useResult
  $Res call({
    @JsonKey(name: 'pc_id') int? pcId,
    @JsonKey(name: 'p_b_id') int? pbId,
    @JsonKey(name: 'b_id') int? bId,
    String name,
    int? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class _$ProductCategoryCopyWithImpl<$Res, $Val extends ProductCategory>
    implements $ProductCategoryCopyWith<$Res> {
  _$ProductCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pcId = freezed,
    Object? pbId = freezed,
    Object? bId = freezed,
    Object? name = null,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            pcId:
                freezed == pcId
                    ? _value.pcId
                    : pcId // ignore: cast_nullable_to_non_nullable
                        as int?,
            pbId:
                freezed == pbId
                    ? _value.pbId
                    : pbId // ignore: cast_nullable_to_non_nullable
                        as int?,
            bId:
                freezed == bId
                    ? _value.bId
                    : bId // ignore: cast_nullable_to_non_nullable
                        as int?,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as int?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductCategoryImplCopyWith<$Res>
    implements $ProductCategoryCopyWith<$Res> {
  factory _$$ProductCategoryImplCopyWith(
    _$ProductCategoryImpl value,
    $Res Function(_$ProductCategoryImpl) then,
  ) = __$$ProductCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'pc_id') int? pcId,
    @JsonKey(name: 'p_b_id') int? pbId,
    @JsonKey(name: 'b_id') int? bId,
    String name,
    int? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class __$$ProductCategoryImplCopyWithImpl<$Res>
    extends _$ProductCategoryCopyWithImpl<$Res, _$ProductCategoryImpl>
    implements _$$ProductCategoryImplCopyWith<$Res> {
  __$$ProductCategoryImplCopyWithImpl(
    _$ProductCategoryImpl _value,
    $Res Function(_$ProductCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pcId = freezed,
    Object? pbId = freezed,
    Object? bId = freezed,
    Object? name = null,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ProductCategoryImpl(
        pcId:
            freezed == pcId
                ? _value.pcId
                : pcId // ignore: cast_nullable_to_non_nullable
                    as int?,
        pbId:
            freezed == pbId
                ? _value.pbId
                : pbId // ignore: cast_nullable_to_non_nullable
                    as int?,
        bId:
            freezed == bId
                ? _value.bId
                : bId // ignore: cast_nullable_to_non_nullable
                    as int?,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as int?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductCategoryImpl implements _ProductCategory {
  const _$ProductCategoryImpl({
    @JsonKey(name: 'pc_id') this.pcId,
    @JsonKey(name: 'p_b_id') this.pbId,
    @JsonKey(name: 'b_id') this.bId,
    required this.name,
    this.status,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  });

  factory _$ProductCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductCategoryImplFromJson(json);

  @override
  @JsonKey(name: 'pc_id')
  final int? pcId;
  @override
  @JsonKey(name: 'p_b_id')
  final int? pbId;
  @override
  @JsonKey(name: 'b_id')
  final int? bId;
  @override
  final String name;
  @override
  final int? status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'ProductCategory(pcId: $pcId, pbId: $pbId, bId: $bId, name: $name, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductCategoryImpl &&
            (identical(other.pcId, pcId) || other.pcId == pcId) &&
            (identical(other.pbId, pbId) || other.pbId == pbId) &&
            (identical(other.bId, bId) || other.bId == bId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    pcId,
    pbId,
    bId,
    name,
    status,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ProductCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCategoryImplCopyWith<_$ProductCategoryImpl> get copyWith =>
      __$$ProductCategoryImplCopyWithImpl<_$ProductCategoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductCategoryImplToJson(this);
  }
}

abstract class _ProductCategory implements ProductCategory {
  const factory _ProductCategory({
    @JsonKey(name: 'pc_id') final int? pcId,
    @JsonKey(name: 'p_b_id') final int? pbId,
    @JsonKey(name: 'b_id') final int? bId,
    required final String name,
    final int? status,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
  }) = _$ProductCategoryImpl;

  factory _ProductCategory.fromJson(Map<String, dynamic> json) =
      _$ProductCategoryImpl.fromJson;

  @override
  @JsonKey(name: 'pc_id')
  int? get pcId;
  @override
  @JsonKey(name: 'p_b_id')
  int? get pbId;
  @override
  @JsonKey(name: 'b_id')
  int? get bId;
  @override
  String get name;
  @override
  int? get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of ProductCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductCategoryImplCopyWith<_$ProductCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductTax _$ProductTaxFromJson(Map<String, dynamic> json) {
  return _ProductTax.fromJson(json);
}

/// @nodoc
mixin _$ProductTax {
  @JsonKey(name: 'tc_id')
  int? get tcId => throw _privateConstructorUsedError;
  @JsonKey(name: 'b_id')
  int? get bId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  int? get split => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductTax to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductTax
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductTaxCopyWith<ProductTax> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductTaxCopyWith<$Res> {
  factory $ProductTaxCopyWith(
    ProductTax value,
    $Res Function(ProductTax) then,
  ) = _$ProductTaxCopyWithImpl<$Res, ProductTax>;
  @useResult
  $Res call({
    @JsonKey(name: 'tc_id') int? tcId,
    @JsonKey(name: 'b_id') int? bId,
    String name,
    String? value,
    int? split,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class _$ProductTaxCopyWithImpl<$Res, $Val extends ProductTax>
    implements $ProductTaxCopyWith<$Res> {
  _$ProductTaxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductTax
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tcId = freezed,
    Object? bId = freezed,
    Object? name = null,
    Object? value = freezed,
    Object? split = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            tcId:
                freezed == tcId
                    ? _value.tcId
                    : tcId // ignore: cast_nullable_to_non_nullable
                        as int?,
            bId:
                freezed == bId
                    ? _value.bId
                    : bId // ignore: cast_nullable_to_non_nullable
                        as int?,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            value:
                freezed == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as String?,
            split:
                freezed == split
                    ? _value.split
                    : split // ignore: cast_nullable_to_non_nullable
                        as int?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductTaxImplCopyWith<$Res>
    implements $ProductTaxCopyWith<$Res> {
  factory _$$ProductTaxImplCopyWith(
    _$ProductTaxImpl value,
    $Res Function(_$ProductTaxImpl) then,
  ) = __$$ProductTaxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'tc_id') int? tcId,
    @JsonKey(name: 'b_id') int? bId,
    String name,
    String? value,
    int? split,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class __$$ProductTaxImplCopyWithImpl<$Res>
    extends _$ProductTaxCopyWithImpl<$Res, _$ProductTaxImpl>
    implements _$$ProductTaxImplCopyWith<$Res> {
  __$$ProductTaxImplCopyWithImpl(
    _$ProductTaxImpl _value,
    $Res Function(_$ProductTaxImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductTax
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tcId = freezed,
    Object? bId = freezed,
    Object? name = null,
    Object? value = freezed,
    Object? split = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ProductTaxImpl(
        tcId:
            freezed == tcId
                ? _value.tcId
                : tcId // ignore: cast_nullable_to_non_nullable
                    as int?,
        bId:
            freezed == bId
                ? _value.bId
                : bId // ignore: cast_nullable_to_non_nullable
                    as int?,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        value:
            freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as String?,
        split:
            freezed == split
                ? _value.split
                : split // ignore: cast_nullable_to_non_nullable
                    as int?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductTaxImpl implements _ProductTax {
  const _$ProductTaxImpl({
    @JsonKey(name: 'tc_id') this.tcId,
    @JsonKey(name: 'b_id') this.bId,
    required this.name,
    this.value,
    this.split,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  });

  factory _$ProductTaxImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductTaxImplFromJson(json);

  @override
  @JsonKey(name: 'tc_id')
  final int? tcId;
  @override
  @JsonKey(name: 'b_id')
  final int? bId;
  @override
  final String name;
  @override
  final String? value;
  @override
  final int? split;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'ProductTax(tcId: $tcId, bId: $bId, name: $name, value: $value, split: $split, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductTaxImpl &&
            (identical(other.tcId, tcId) || other.tcId == tcId) &&
            (identical(other.bId, bId) || other.bId == bId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.split, split) || other.split == split) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    tcId,
    bId,
    name,
    value,
    split,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ProductTax
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductTaxImplCopyWith<_$ProductTaxImpl> get copyWith =>
      __$$ProductTaxImplCopyWithImpl<_$ProductTaxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductTaxImplToJson(this);
  }
}

abstract class _ProductTax implements ProductTax {
  const factory _ProductTax({
    @JsonKey(name: 'tc_id') final int? tcId,
    @JsonKey(name: 'b_id') final int? bId,
    required final String name,
    final String? value,
    final int? split,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
  }) = _$ProductTaxImpl;

  factory _ProductTax.fromJson(Map<String, dynamic> json) =
      _$ProductTaxImpl.fromJson;

  @override
  @JsonKey(name: 'tc_id')
  int? get tcId;
  @override
  @JsonKey(name: 'b_id')
  int? get bId;
  @override
  String get name;
  @override
  String? get value;
  @override
  int? get split;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of ProductTax
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductTaxImplCopyWith<_$ProductTaxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
