import 'package:go_router/go_router.dart';
import '../local/session_service.dart';
import '../../feature/auth/presentation/pages/login_page.dart';
import '../../feature/auth/presentation/pages/otp_page.dart';
import '../../feature/leads/presentation/pages/lead_form_page.dart';
import '../../feature/main/presentation/pages/main_screen.dart';
import 'package:fix_crm_new/feature/tasks/presentation/pages/task_list_page.dart';
import 'package:fix_crm_new/feature/tasks/presentation/pages/task_form_page.dart';
import 'package:fix_crm_new/feature/visit/presentation/pages/visit_list_page.dart';
import 'package:fix_crm_new/feature/visit/presentation/pages/add_visit_page.dart';
import 'package:fix_crm_new/feature/products/presentation/pages/product_list_page.dart';
import 'package:fix_crm_new/feature/products/presentation/pages/product_detail_page.dart';

class AppRouter {
  static const String root = '/';
  static const String login = '/login';
  static const String otp = '/otp';
  static const String leadForm = '/lead-form';
  static const String taskList = '/tasks';
  static const String taskForm = '/task-form';
  static const String visitList = '/visits';
  static const String visitForm = '/visit-form';
  static const String productList = '/products';

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
      GoRoute(
        path: leadForm,
        builder: (context, state) {
          final lead = state.extra as Map<String, dynamic>?;
          return LeadFormPage(lead: lead);
        },
      ),
      GoRoute(
        path: taskList,
        builder: (context, state) => const TaskListPage(),
      ),
      GoRoute(
        path: taskForm,
        builder: (context, state) => const TaskFormPage(),
      ),
      GoRoute(
        path: visitList,
        builder: (context, state) => const VisitListPage(),
      ),
      GoRoute(
        path: visitForm,
        builder: (context, state) => const AddVisitPage(),
      ),
      GoRoute(
        path: productList,
        builder: (context, state) => const ProductListPage(),
      ),
      GoRoute(
        path: '/product-detail',
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return ProductDetailPage(
            brand: args['brand']!,
            category: args['category']!,
            product: args['product']!,
            variant: args['variant']!,
          );
        },
      ),
    ],
  );
}
