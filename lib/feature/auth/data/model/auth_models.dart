// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}

@freezed
class SendOtpRequest with _$SendOtpRequest {
  const factory SendOtpRequest({
    @JsonKey(name: 'mobile_number') required String mobileNumber,
  }) = _SendOtpRequest;

  factory SendOtpRequest.fromJson(Map<String, dynamic> json) => _$SendOtpRequestFromJson(json);
}

@freezed
class VerifyOtpRequest with _$VerifyOtpRequest {
  const factory VerifyOtpRequest({
    @JsonKey(name: 'mobile_number') required String mobileNumber,
    required String otp,
  }) = _VerifyOtpRequest;

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) => _$VerifyOtpRequestFromJson(json);
}

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    @Default(false) bool status,
    @Default('') String message,
    String? token,
    AuthResult? result,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}

@freezed
class AuthResult with _$AuthResult {
  const AuthResult._();

  const factory AuthResult({
    @JsonKey(name: 'emp_id') @Default(0) int empId,
    @JsonKey(name: 'business_id') @Default(0) int businessId,
    @JsonKey(name: 'role_id') @Default(0) int roleId,
    @Default('') String name,
    @JsonKey(name: 'emp_phone') @Default('') String empPhone,
    @Default('') String email,
    @JsonKey(name: 'emp_code') String? empCode,
    String? designation,
    String? region,
    @JsonKey(name: 'reporting_manager') String? reportingManager,
    String? otp,
    @JsonKey(name: 'auth_token') String? authToken,
    @JsonKey(name: 'emp_is_deleted') @Default(0) int empIsDeleted,
    @Default(0) int status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
  }) = _AuthResult;

  factory AuthResult.fromJson(Map<String, dynamic> json) => _$AuthResultFromJson(json);

  String get roleName {
    if (roleId == 1) return 'Admin';
    if (roleId == 2) return 'Employee';
    return 'User';
  }
}
