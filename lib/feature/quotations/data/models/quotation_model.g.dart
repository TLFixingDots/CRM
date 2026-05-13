// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuotationItemImpl _$$QuotationItemImplFromJson(Map<String, dynamic> json) =>
    _$QuotationItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      taxRate: (json['taxRate'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
    );

Map<String, dynamic> _$$QuotationItemImplToJson(_$QuotationItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'taxRate': instance.taxRate,
      'discount': instance.discount,
    };

_$QuotationModelImpl _$$QuotationModelImplFromJson(Map<String, dynamic> json) =>
    _$QuotationModelImpl(
      id: json['id'] as String,
      leadId: json['leadId'] as String,
      customerName: json['customerName'] as String,
      contactPerson: json['contactPerson'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      date: DateTime.parse(json['date'] as String),
      validUntil: DateTime.parse(json['validUntil'] as String),
      items:
          (json['items'] as List<dynamic>)
              .map((e) => QuotationItem.fromJson(e as Map<String, dynamic>))
              .toList(),
      notes: json['notes'] as String,
      termsAndConditions: json['termsAndConditions'] as String,
    );

Map<String, dynamic> _$$QuotationModelImplToJson(
  _$QuotationModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'leadId': instance.leadId,
  'customerName': instance.customerName,
  'contactPerson': instance.contactPerson,
  'email': instance.email,
  'phone': instance.phone,
  'address': instance.address,
  'date': instance.date.toIso8601String(),
  'validUntil': instance.validUntil.toIso8601String(),
  'items': instance.items,
  'notes': instance.notes,
  'termsAndConditions': instance.termsAndConditions,
};
