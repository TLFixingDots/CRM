// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  dueDate: json['dueDate'] as String? ?? '',
  status: json['status'] as String? ?? 'Pending',
  priority: json['priority'] as String? ?? 'Medium',
  relatedLeadName: json['relatedLeadName'] as String? ?? '',
  createdAt: json['createdAt'] as String? ?? '',
);

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'dueDate': instance.dueDate,
      'status': instance.status,
      'priority': instance.priority,
      'relatedLeadName': instance.relatedLeadName,
      'createdAt': instance.createdAt,
    };
