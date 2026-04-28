import 'dart:developer' as dev;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/api/api_client.dart';
import '../../../../core/api/api.dart'; // Import central constants
import '../model/login_request.dart';
import '../model/login_response.dart';
import '../model/verify_otp_request.dart';
import '../model/verify_otp_response.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  Future<LoginResponse> login(LoginRequest request) async {
    dev.log('[AuthRepository] POST ${ApiStrings.login}', name: 'flutter');
    final response = await DioClient.post(
      ApiStrings.login, 
      data: request.toJson(),
    );
    return LoginResponse.fromJson(response.data);
  }

  Future<VerifyOtpResponse> verifyOtp(VerifyOtpRequest request) async {
    // Using the user-preferred endpoint
    dev.log('[AuthRepository] POST ${ApiStrings.employeeLoginVerifyOtp}', name: 'flutter');
    final response = await DioClient.post(
      ApiStrings.employeeLoginVerifyOtp, 
      data: request.toJson(),
    );
    return VerifyOtpResponse.fromJson(response.data);
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}
