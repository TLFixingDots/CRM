import 'dart:developer' as dev;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/api/api_client.dart';
import '../../../../core/api/api.dart'; // Import central constants
import '../model/auth_models.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  Future<AuthResponse> login(LoginRequest request) async {
    dev.log('[AuthRepository] POST ${ApiStrings.login}', name: 'flutter');
    final response = await DioClient.post(
      ApiStrings.login, 
      data: request.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> sendOtp(SendOtpRequest request) async {
    dev.log('[AuthRepository] POST ${ApiStrings.sendOtp}', name: 'flutter');
    final response = await DioClient.post(
      ApiStrings.sendOtp, 
      data: request.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> verifyOtp(VerifyOtpRequest request) async {
    dev.log('[AuthRepository] POST ${ApiStrings.verifyOtp}', name: 'flutter');
    final response = await DioClient.post(
      ApiStrings.verifyOtp, 
      data: request.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<bool> logout() async {
    dev.log('[AuthRepository] POST ${ApiStrings.logout}', name: 'flutter');
    try {
      final response = await DioClient.post(ApiStrings.logout);
      return response.data['status'] == true;
    } catch (e) {
      dev.log('[AuthRepository] Logout API failed: $e', name: 'flutter');
      return false;
    }
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}
