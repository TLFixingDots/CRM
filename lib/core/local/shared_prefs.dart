import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/pref_keys.dart';
import '../../feature/auth/data/model/auth_models.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Token
  static Future<void> setToken(String token) async {
    await _prefs.setString(PrefKeys.token, token);
  }

  static String? getToken() {
    return _prefs.getString(PrefKeys.token);
  }

  // User Result
  static Future<void> setUser(AuthResult user) async {
    await _prefs.setString(PrefKeys.user, jsonEncode(user.toJson()));
  }

  static AuthResult? getUser() {
    final userStr = _prefs.getString(PrefKeys.user);
    if (userStr == null) return null;
    return AuthResult.fromJson(jsonDecode(userStr));
  }

  // Login Status
  static Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool(PrefKeys.isLoggedIn, value);
  }

  static bool isLoggedIn() {
    return _prefs.getBool(PrefKeys.isLoggedIn) ?? false;
  }

  // Clear all
  static Future<void> clear() async {
    await _prefs.clear();
  }
}


// USE STORED INFORMATION LIKE THIS

// final user = SharedPrefs.getUser();
// print(user?.name);
