import 'package:flutter/foundation.dart';

class LoggerService {
  static void log(String message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      debugPrint('LOG: $message');
      if (error != null) debugPrint('ERROR: $error');
      if (stackTrace != null) debugPrint('STACKTRACE: $stackTrace');
    } else {
      // Here you would send logs to Sentry or Crashlytics
      // FirebaseCrashlytics.instance.log(message);
      // if (error != null) FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    log(message, error: error, stackTrace: stackTrace);
  }
}
