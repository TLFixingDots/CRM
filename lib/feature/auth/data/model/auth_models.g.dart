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
      employeeId: (json['employee_id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      roleId: (json['role_id'] as num?)?.toInt() ?? 0,
      roleName: json['role_name'] as String? ?? '',
    );

Map<String, dynamic> _$$AuthResultImplToJson(_$AuthResultImpl instance) =>
    <String, dynamic>{
      'employee_id': instance.employeeId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'role_id': instance.roleId,
      'role_name': instance.roleName,
    };
