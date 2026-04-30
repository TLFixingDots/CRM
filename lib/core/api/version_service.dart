import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/foundation.dart';

class VersionService {
  static Future<void> checkVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final version = packageInfo.version;
      final buildNumber = packageInfo.buildNumber;
      
      debugPrint('App Version: $version ($buildNumber)');
      
      // Here you would typically call an API to check if this version is allowed
      // Example:
      // final minVersion = await api.getMinVersion();
      // if (isLowerThan(version, minVersion)) { showForceUpdateDialog(); }
      
    } catch (e) {
      debugPrint('Version Check Error: $e');
    }
  }
}
