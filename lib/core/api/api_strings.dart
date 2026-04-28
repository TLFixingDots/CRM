
// To access any global config if needed, or better use a DI/Locator

class ApiStrings {
  // Base URLs are usually handled by EnvConfig, but we can provide a getter here
  static String get baseUrl => 'http://uat.fixcrm.app/api'; 

  // Endpoints
  static const String login = '/employee-login';
  static const String verifyOtp = '/employee-verify-otp';
  
  // Suggested by user for login verification
  static const String employeeLoginVerifyOtp = '/employee-verify-otp';
}
