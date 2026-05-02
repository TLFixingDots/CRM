// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadImpl _$$LeadImplFromJson(Map<String, dynamic> json) => _$LeadImpl(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  company: json['company'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  email: json['email'] as String? ?? '',
  status: json['status'] as String? ?? 'New',
  priority: json['priority'] as String? ?? 'Medium',
  productCategory: json['productCategory'] as String? ?? '',
  productModel: json['productModel'] as String? ?? '',
  source: json['source'] as String? ?? 'Direct',
  createdAt: json['createdAt'] as String? ?? '',
);

Map<String, dynamic> _$$LeadImplToJson(_$LeadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'company': instance.company,
      'phone': instance.phone,
      'email': instance.email,
      'status': instance.status,
      'priority': instance.priority,
      'productCategory': instance.productCategory,
      'productModel': instance.productModel,
      'source': instance.source,
      'createdAt': instance.createdAt,
    };
