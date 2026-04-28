import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/model/login_request.dart';
import '../../data/model/verify_otp_request.dart';
import 'auth_state.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    return const AuthState.initial();
  }

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.login(
        LoginRequest(email: email, password: password),
      );
      if (response.status) {
        state = AuthState.otpSent(email);
      } else {
        state = AuthState.error(response.message);
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.verifyOtp(
        VerifyOtpRequest(email: email, otp: otp),
      );
      if (response.status) {
        state = const AuthState.success();
      } else {
        state = AuthState.error(response.message);
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  void resetStatus() {
    state = const AuthState.initial();
  }
}
