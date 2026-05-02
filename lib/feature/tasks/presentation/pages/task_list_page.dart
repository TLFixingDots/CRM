import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/custom_widgets/responsive_widgets.dart';

class TaskListPage extends ConsumerStatefulWidget {
  const TaskListPage({super.key});

  @override
  ConsumerState<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends ConsumerState<TaskListPage> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.mainGradient,
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildAnimatedHeader(context),
            _buildFilterChips(),
            Expanded(child: _buildTaskList(isTablet)),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.2),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: _isSearching ? _buildSearchField(context) : _buildDefaultHeader(context),
      ),
    );
  }

  Widget _buildDefaultHeader(BuildContext context) {
    return Row(
      key: const ValueKey('default_header'),
      children: [
        const Text(
          'Tasks',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: AppColors.secondary,
            letterSpacing: -1.5,
          ),
        ),
        const Spacer(),
        _buildCircleAction(Icons.search_rounded, () => setState(() => _isSearching = true)),
        const SizedBox(width: 12),
        _buildCircleAction(Icons.tune_rounded, () {}),
        const SizedBox(width: 12),
        _buildCircleAction(Icons.add_task_rounded, () => context.push(AppRouter.taskForm), isPrimary: true),
      ],
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Row(
      key: const ValueKey('search_field'),
      children: [
        Expanded(
          child: GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            borderRadius: 18,
            child: TextField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                hintStyle: TextStyle(color: AppColors.textSecondary.withValues(alpha: 0.5), fontSize: 14),
                border: InputBorder.none,
                icon: const Icon(Icons.search_rounded, color: AppColors.primary, size: 20),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        _buildCircleAction(Icons.close_rounded, () {
          setState(() {
            _isSearching = false;
            _searchController.clear();
          });
        }),
      ],
    );
  }

  Widget _buildFilterChips() {
    final filters = ['All', 'Today', 'Upcoming', 'Completed', 'Overdue'];
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: FilterChip(
              label: Text(filters[index]),
              selected: isSelected,
              onSelected: (val) {},
              backgroundColor: Colors.white.withValues(alpha: 0.3),
              selectedColor: AppColors.secondary,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppColors.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              side: BorderSide(color: Colors.white.withValues(alpha: 0.5)),
              showCheckmark: false,
            ),
          );
        },
      ),
    );
  }

  Widget _buildTaskList(bool isTablet) {
    final List<Map<String, String>> dummyTasks = [
      {
        'title': 'Call Rajesh Kumar',
        'desc': 'Discuss excavator XP-200 pricing and delivery.',
        'due': 'Today, 02:00 PM',
        'status': 'Pending',
        'priority': 'High',
        'related': 'Rajesh Kumar (Kumar Tech)',
      },
      {
        'title': 'Email Quotation',
        'desc': 'Send updated quote for Power Drill Pro-X.',
        'due': 'Tomorrow, 10:00 AM',
        'status': 'In Progress',
        'priority': 'Medium',
        'related': 'Sneha Patil',
      },
      {
        'title': 'Site Visit',
        'desc': 'Survey site for VoltGuard 5000 installation.',
        'due': '28 May 2024',
        'status': 'Pending',
        'priority': 'High',
        'related': 'Amit Shah',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
      itemCount: dummyTasks.length,
      itemBuilder: (context, index) {
        final task = dummyTasks[index];
        return _buildTaskCard(context, task);
      },
    );
  }

  Widget _buildTaskCard(BuildContext context, Map<String, String> task) {
    Color priorityColor;
    switch (task['priority']?.toLowerCase()) {
      case 'high': priorityColor = Colors.redAccent; break;
      case 'medium': priorityColor = Colors.orange; break;
      default: priorityColor = Colors.blue;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: GlassCard(
        padding: const EdgeInsets.all(0),
        borderRadius: 24,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPriorityIndicator(priorityColor),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task['title']!,
                              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: AppColors.secondary),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              task['desc']!,
                              style: const TextStyle(color: AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      _buildStatusBadge(task['status']!),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildInfoTag(Icons.event_available_rounded, task['due']!, Colors.blueGrey),
                      const SizedBox(width: 12),
                      _buildInfoTag(Icons.link_rounded, task['related']!, AppColors.primary),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.05),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              child: Row(
                children: [
                  const Text(
                    'MARK AS COMPLETE',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: AppColors.success, letterSpacing: 1),
                  ),
                  const Spacer(),
                  _buildActionIcon(Icons.edit_rounded, AppColors.secondary),
                  const SizedBox(width: 10),
                  _buildActionIcon(Icons.delete_outline_rounded, Colors.redAccent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityIndicator(Color color) {
    return Container(
      width: 4,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.3), blurRadius: 4),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
      ),
      child: Text(
        status.toUpperCase(),
        style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: AppColors.secondary),
      ),
    );
  }

  Widget _buildInfoTag(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, size: 14, color: color.withValues(alpha: 0.7)),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color),
        ),
      ],
    );
  }

  Widget _buildActionIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 18),
    );
  }

  Widget _buildCircleAction(IconData icon, VoidCallback onTap, {bool isPrimary = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.primary : Colors.white.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
        ),
        child: Icon(icon, color: isPrimary ? Colors.white : AppColors.secondary, size: 22),
      ),
    );
  }
}
