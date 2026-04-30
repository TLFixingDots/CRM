import 'package:go_router/go_router.dart';
import '../local/session_service.dart';
import '../../feature/auth/presentation/pages/login_page.dart';
import '../../feature/auth/presentation/pages/otp_page.dart';
import '../../feature/dashboard/presentation/pages/dashboard_page.dart';
import '../../feature/main/presentation/pages/main_screen.dart';

class AppRouter {
  static const String root = '/';
  static const String login = '/login';
  static const String otp = '/otp';

  static final router = GoRouter(
    initialLocation: root,
    refreshListenable: SessionService.authNotifier,
    redirect: (context, state) {
      final isLoggedIn = SessionService.authNotifier.value;
      final isLoggingIn = state.matchedLocation == login;
      final isOtp = state.matchedLocation == otp;

      if (!isLoggedIn && !isLoggingIn && !isOtp) {
        return login;
      }
      
      if (isLoggedIn && isLoggingIn) {
        return root;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: root,
        builder: (context, state) => const MainScreen(),
      ),

      GoRoute(
        path: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: otp,
        builder: (context, state) {
          final identifier = state.extra as String? ?? '';
          return OtpPage(identifier: identifier);
        },
      ),
    ],
  );
}
