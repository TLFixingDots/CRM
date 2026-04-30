import 'package:flutter/foundation.dart';
import 'shared_prefs.dart';

class SessionService {
  // A global notifier that the router can listen to
  static final ValueNotifier<bool> authNotifier = ValueNotifier(SharedPrefs.isLoggedIn());

  static void onLogin() {
    authNotifier.value = true;
  }

  static void onLogout() {
    SharedPrefs.clear();
    authNotifier.value = false;
  }
}
