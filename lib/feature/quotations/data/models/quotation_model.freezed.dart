// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuotationItem _$QuotationItemFromJson(Map<String, dynamic> json) {
  return _QuotationItem.fromJson(json);
}

/// @nodoc
mixin _$QuotationItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  double get taxRate => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;

  /// Serializes this QuotationItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuotationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuotationItemCopyWith<QuotationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotationItemCopyWith<$Res> {
  factory $QuotationItemCopyWith(
    QuotationItem value,
    $Res Function(QuotationItem) then,
  ) = _$QuotationItemCopyWithImpl<$Res, QuotationItem>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    double quantity,
    double unitPrice,
    double taxRate,
    double discount,
  });
}

/// @nodoc
class _$QuotationItemCopyWithImpl<$Res, $Val extends QuotationItem>
    implements $QuotationItemCopyWith<$Res> {
  _$QuotationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuotationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? taxRate = null,
    Object? discount = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            quantity:
                null == quantity
                    ? _value.quantity
                    : quantity // ignore: cast_nullable_to_non_nullable
                        as double,
            unitPrice:
                null == unitPrice
                    ? _value.unitPrice
                    : unitPrice // ignore: cast_nullable_to_non_nullable
                        as double,
            taxRate:
                null == taxRate
                    ? _value.taxRate
                    : taxRate // ignore: cast_nullable_to_non_nullable
                        as double,
            discount:
                null == discount
                    ? _value.discount
                    : discount // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuotationItemImplCopyWith<$Res>
    implements $QuotationItemCopyWith<$Res> {
  factory _$$QuotationItemImplCopyWith(
    _$QuotationItemImpl value,
    $Res Function(_$QuotationItemImpl) then,
  ) = __$$QuotationItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    double quantity,
    double unitPrice,
    double taxRate,
    double discount,
  });
}

/// @nodoc
class __$$QuotationItemImplCopyWithImpl<$Res>
    extends _$QuotationItemCopyWithImpl<$Res, _$QuotationItemImpl>
    implements _$$QuotationItemImplCopyWith<$Res> {
  __$$QuotationItemImplCopyWithImpl(
    _$QuotationItemImpl _value,
    $Res Function(_$QuotationItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuotationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? taxRate = null,
    Object? discount = null,
  }) {
    return _then(
      _$QuotationItemImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        quantity:
            null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                    as double,
        unitPrice:
            null == unitPrice
                ? _value.unitPrice
                : unitPrice // ignore: cast_nullable_to_non_nullable
                    as double,
        taxRate:
            null == taxRate
                ? _value.taxRate
                : taxRate // ignore: cast_nullable_to_non_nullable
                    as double,
        discount:
            null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuotationItemImpl implements _QuotationItem {
  const _$QuotationItemImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.unitPrice,
    required this.taxRate,
    required this.discount,
  });

  factory _$QuotationItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuotationItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double quantity;
  @override
  final double unitPrice;
  @override
  final double taxRate;
  @override
  final double discount;

  @override
  String toString() {
    return 'QuotationItem(id: $id, name: $name, description: $description, quantity: $quantity, unitPrice: $unitPrice, taxRate: $taxRate, discount: $discount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuotationItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.taxRate, taxRate) || other.taxRate == taxRate) &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    quantity,
    unitPrice,
    taxRate,
    discount,
  );

  /// Create a copy of QuotationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuotationItemImplCopyWith<_$QuotationItemImpl> get copyWith =>
      __$$QuotationItemImplCopyWithImpl<_$QuotationItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuotationItemImplToJson(this);
  }
}

abstract class _QuotationItem implements QuotationItem {
  const factory _QuotationItem({
    required final String id,
    required final String name,
    required final String description,
    required final double quantity,
    required final double unitPrice,
    required final double taxRate,
    required final double discount,
  }) = _$QuotationItemImpl;

  factory _QuotationItem.fromJson(Map<String, dynamic> json) =
      _$QuotationItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get quantity;
  @override
  double get unitPrice;
  @override
  double get taxRate;
  @override
  double get discount;

  /// Create a copy of QuotationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuotationItemImplCopyWith<_$QuotationItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuotationModel _$QuotationModelFromJson(Map<String, dynamic> json) {
  return _QuotationModel.fromJson(json);
}

/// @nodoc
mixin _$QuotationModel {
  String get id => throw _privateConstructorUsedError;
  String get leadId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get contactPerson => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get validUntil => throw _privateConstructorUsedError;
  List<QuotationItem> get items => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String get termsAndConditions => throw _privateConstructorUsedError;

  /// Serializes this QuotationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuotationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuotationModelCopyWith<QuotationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotationModelCopyWith<$Res> {
  factory $QuotationModelCopyWith(
    QuotationModel value,
    $Res Function(QuotationModel) then,
  ) = _$QuotationModelCopyWithImpl<$Res, QuotationModel>;
  @useResult
  $Res call({
    String id,
    String leadId,
    String customerName,
    String contactPerson,
    String email,
    String phone,
    String address,
    DateTime date,
    DateTime validUntil,
    List<QuotationItem> items,
    String notes,
    String termsAndConditions,
  });
}

/// @nodoc
class _$QuotationModelCopyWithImpl<$Res, $Val extends QuotationModel>
    implements $QuotationModelCopyWith<$Res> {
  _$QuotationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuotationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? leadId = null,
    Object? customerName = null,
    Object? contactPerson = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? date = null,
    Object? validUntil = null,
    Object? items = null,
    Object? notes = null,
    Object? termsAndConditions = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            leadId:
                null == leadId
                    ? _value.leadId
                    : leadId // ignore: cast_nullable_to_non_nullable
                        as String,
            customerName:
                null == customerName
                    ? _value.customerName
                    : customerName // ignore: cast_nullable_to_non_nullable
                        as String,
            contactPerson:
                null == contactPerson
                    ? _value.contactPerson
                    : contactPerson // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            phone:
                null == phone
                    ? _value.phone
                    : phone // ignore: cast_nullable_to_non_nullable
                        as String,
            address:
                null == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String,
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            validUntil:
                null == validUntil
                    ? _value.validUntil
                    : validUntil // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<QuotationItem>,
            notes:
                null == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String,
            termsAndConditions:
                null == termsAndConditions
                    ? _value.termsAndConditions
                    : termsAndConditions // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuotationModelImplCopyWith<$Res>
    implements $QuotationModelCopyWith<$Res> {
  factory _$$QuotationModelImplCopyWith(
    _$QuotationModelImpl value,
    $Res Function(_$QuotationModelImpl) then,
  ) = __$$QuotationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String leadId,
    String customerName,
    String contactPerson,
    String email,
    String phone,
    String address,
    DateTime date,
    DateTime validUntil,
    List<QuotationItem> items,
    String notes,
    String termsAndConditions,
  });
}

/// @nodoc
class __$$QuotationModelImplCopyWithImpl<$Res>
    extends _$QuotationModelCopyWithImpl<$Res, _$QuotationModelImpl>
    implements _$$QuotationModelImplCopyWith<$Res> {
  __$$QuotationModelImplCopyWithImpl(
    _$QuotationModelImpl _value,
    $Res Function(_$QuotationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuotationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? leadId = null,
    Object? customerName = null,
    Object? contactPerson = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? date = null,
    Object? validUntil = null,
    Object? items = null,
    Object? notes = null,
    Object? termsAndConditions = null,
  }) {
    return _then(
      _$QuotationModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        leadId:
            null == leadId
                ? _value.leadId
                : leadId // ignore: cast_nullable_to_non_nullable
                    as String,
        customerName:
            null == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                    as String,
        contactPerson:
            null == contactPerson
                ? _value.contactPerson
                : contactPerson // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        phone:
            null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                    as String,
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String,
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        validUntil:
            null == validUntil
                ? _value.validUntil
                : validUntil // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<QuotationItem>,
        notes:
            null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String,
        termsAndConditions:
            null == termsAndConditions
                ? _value.termsAndConditions
                : termsAndConditions // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuotationModelImpl extends _QuotationModel {
  const _$QuotationModelImpl({
    required this.id,
    required this.leadId,
    required this.customerName,
    required this.contactPerson,
    required this.email,
    required this.phone,
    required this.address,
    required this.date,
    required this.validUntil,
    required final List<QuotationItem> items,
    required this.notes,
    required this.termsAndConditions,
  }) : _items = items,
       super._();

  factory _$QuotationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuotationModelImplFromJson(json);

  @override
  final String id;
  @override
  final String leadId;
  @override
  final String customerName;
  @override
  final String contactPerson;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String address;
  @override
  final DateTime date;
  @override
  final DateTime validUntil;
  final List<QuotationItem> _items;
  @override
  List<QuotationItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String notes;
  @override
  final String termsAndConditions;

  @override
  String toString() {
    return 'QuotationModel(id: $id, leadId: $leadId, customerName: $customerName, contactPerson: $contactPerson, email: $email, phone: $phone, address: $address, date: $date, validUntil: $validUntil, items: $items, notes: $notes, termsAndConditions: $termsAndConditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuotationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.leadId, leadId) || other.leadId == leadId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.contactPerson, contactPerson) ||
                other.contactPerson == contactPerson) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                other.termsAndConditions == termsAndConditions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    leadId,
    customerName,
    contactPerson,
    email,
    phone,
    address,
    date,
    validUntil,
    const DeepCollectionEquality().hash(_items),
    notes,
    termsAndConditions,
  );

  /// Create a copy of QuotationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuotationModelImplCopyWith<_$QuotationModelImpl> get copyWith =>
      __$$QuotationModelImplCopyWithImpl<_$QuotationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QuotationModelImplToJson(this);
  }
}

abstract class _QuotationModel extends QuotationModel {
  const factory _QuotationModel({
    required final String id,
    required final String leadId,
    required final String customerName,
    required final String contactPerson,
    required final String email,
    required final String phone,
    required final String address,
    required final DateTime date,
    required final DateTime validUntil,
    required final List<QuotationItem> items,
    required final String notes,
    required final String termsAndConditions,
  }) = _$QuotationModelImpl;
  const _QuotationModel._() : super._();

  factory _QuotationModel.fromJson(Map<String, dynamic> json) =
      _$QuotationModelImpl.fromJson;

  @override
  String get id;
  @override
  String get leadId;
  @override
  String get customerName;
  @override
  String get contactPerson;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get address;
  @override
  DateTime get date;
  @override
  DateTime get validUntil;
  @override
  List<QuotationItem> get items;
  @override
  String get notes;
  @override
  String get termsAndConditions;

  /// Create a copy of QuotationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuotationModelImplCopyWith<_$QuotationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
