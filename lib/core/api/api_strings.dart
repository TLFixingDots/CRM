
// To access any global config if needed, or better use a DI/Locator

class ApiStrings {
  // Base URLs are usually handled by EnvConfig, but we can provide a getter here
  static String get baseUrl => 'https://uat.fixcrm.app/api'; 

  // Endpoints
  static const String login = '/employee-login';
  static const String sendOtp = '/sendotp-login';
  static const String verifyOtp = '/verifyotp-login';
  static const String products = '/products';
  static const String logout = '/logout';
}
