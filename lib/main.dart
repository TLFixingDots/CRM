import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'theme/app_theme.dart';
import 'core/api/api_client.dart';
import 'core/provider_observer.dart';
import 'core/config/env_config.dart';
import 'feature/auth/presentation/pages/login_page.dart';

Future<void> bootstrap(EnvConfig config) async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Set Provider Observer (handled inside ProviderScope)
      
      // Log Environment
      debugPrint('env : Env.${config.env.name}');

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
      debugPrint('Global Error: $error');
      debugPrint('Stack Trace: $stack');
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
        return MaterialApp(
          title: config.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: const LoginPage(),
        );
      },
    );
  }
}
