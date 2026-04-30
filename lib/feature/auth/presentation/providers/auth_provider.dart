import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/model/auth_models.dart';
import 'auth_state.dart';
import '../../../../core/local/shared_prefs.dart';
import '../../../../core/local/session_service.dart';

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
        // Save token and user info
        if (response.token != null) await SharedPrefs.setToken(response.token!);
        if (response.result != null) await SharedPrefs.setUser(response.result!);
        await SharedPrefs.setLoggedIn(true);
        
        // Notify router
        SessionService.onLogin();
        
        state = const AuthState.success();
      } else {
        state = AuthState.error(response.message);
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> sendOtp(String mobileNumber) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.sendOtp(
        SendOtpRequest(mobileNumber: mobileNumber),
      );
      if (response.status) {
        state = AuthState.otpSent(mobileNumber);
      } else {
        state = AuthState.error(response.message);
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> verifyOtp(String mobileNumber, String otp) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.verifyOtp(
        VerifyOtpRequest(mobileNumber: mobileNumber, otp: otp),
      );
      if (response.status) {
        // Save token and user info
        if (response.token != null) await SharedPrefs.setToken(response.token!);
        if (response.result != null) await SharedPrefs.setUser(response.result!);
        await SharedPrefs.setLoggedIn(true);

        // Notify router
        SessionService.onLogin();

        state = const AuthState.success();
      } else {
        state = AuthState.error(response.message);
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> logout() async {
    SessionService.onLogout();
    state = const AuthState.initial();
  }

  void resetStatus() {
    state = const AuthState.initial();
  }
}
