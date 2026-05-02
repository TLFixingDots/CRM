import 'package:fix_crm_new/feature/dashboard/presentation/pages/dashboard_page.dart';
import 'package:fix_crm_new/utils/custom_widgets/custom_drawer.dart';
import 'package:fix_crm_new/utils/custom_widgets/glass_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../leads/presentation/pages/lead_list_page.dart';
import '../../../tasks/presentation/pages/task_list_page.dart';
import '../../../visit/presentation/pages/visit_list_page.dart';
class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    const DashboardPage(),
    const LeadListPage(),
    const VisitListPage(),
    const TaskListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      // Use extendBody to allow the content to go behind the floating navbar
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: GlassBottomNavbar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
