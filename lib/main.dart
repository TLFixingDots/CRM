import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'theme/app_theme.dart';
import 'core/api/api_client.dart';
import 'core/provider_observer.dart';
import 'core/config/env_config.dart';
import 'core/local/shared_prefs.dart';
import 'core/router/app_router.dart';
import 'core/api/version_service.dart';
import 'core/utils/logger_service.dart';

Future<void> bootstrap(EnvConfig config) async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      
      // Initialize SharedPreferences
      await SharedPrefs.init();

      // Check App Version
      await VersionService.checkVersion();

      // Log Environment
      LoggerService.log('env : Env.${config.env.name}');

      // Initialize Core Services with Env base URL
      DioClient.init(config.baseUrl);

      runApp(
        ProviderScope(
          observers: [CustomProviderObserver()],
          child: MyApp(config: config),
        ),
      );
    },
    (error, stack) {
      LoggerService.error('Global Error', error, stack);
    },
  );
}

class MyApp extends StatelessWidget {
  final EnvConfig config;
  const MyApp({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: config.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
