// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_$SendOtpRequestImpl _$$SendOtpRequestImplFromJson(Map<String, dynamic> json) =>
    _$SendOtpRequestImpl(mobileNumber: json['mobile_number'] as String);

Map<String, dynamic> _$$SendOtpRequestImplToJson(
  _$SendOtpRequestImpl instance,
) => <String, dynamic>{'mobile_number': instance.mobileNumber};

_$VerifyOtpRequestImpl _$$VerifyOtpRequestImplFromJson(
  Map<String, dynamic> json,
) => _$VerifyOtpRequestImpl(
  mobileNumber: json['mobile_number'] as String,
  otp: json['otp'] as String,
);

Map<String, dynamic> _$$VerifyOtpRequestImplToJson(
  _$VerifyOtpRequestImpl instance,
) => <String, dynamic>{
  'mobile_number': instance.mobileNumber,
  'otp': instance.otp,
};

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      token: json['token'] as String?,
      result:
          json['result'] == null
              ? null
              : AuthResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'result': instance.result,
    };

_$AuthResultImpl _$$AuthResultImplFromJson(Map<String, dynamic> json) =>
    _$AuthResultImpl(
      empId: (json['emp_id'] as num?)?.toInt() ?? 0,
      businessId: (json['business_id'] as num?)?.toInt() ?? 0,
      roleId: (json['role_id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      empPhone: json['emp_phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      empCode: json['emp_code'] as String?,
      designation: json['designation'] as String?,
      region: json['region'] as String?,
      reportingManager: json['reporting_manager'] as String?,
      otp: json['otp'] as String?,
      authToken: json['auth_token'] as String?,
      empIsDeleted: (json['emp_is_deleted'] as num?)?.toInt() ?? 0,
      status: (json['status'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
    );

Map<String, dynamic> _$$AuthResultImplToJson(_$AuthResultImpl instance) =>
    <String, dynamic>{
      'emp_id': instance.empId,
      'business_id': instance.businessId,
      'role_id': instance.roleId,
      'name': instance.name,
      'emp_phone': instance.empPhone,
      'email': instance.email,
      'emp_code': instance.empCode,
      'designation': instance.designation,
      'region': instance.region,
      'reporting_manager': instance.reportingManager,
      'otp': instance.otp,
      'auth_token': instance.authToken,
      'emp_is_deleted': instance.empIsDeleted,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
