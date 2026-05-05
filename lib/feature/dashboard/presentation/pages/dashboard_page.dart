import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../theme/app_colors.dart';
import '../../../../core/local/shared_prefs.dart';
import '../../../../utils/custom_widgets/responsive_widgets.dart';
import '../../../../utils/custom_widgets/custom_app_bar.dart';
import '../providers/dashboard_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = SharedPrefs.getUser();
    final filters = ref.watch(dashboardFilterProvider);
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
            CustomAppBar(
              title: user?.name ?? 'Admin',
              subtitle: _getGreeting(),
              leadingIcon: Icons.notes,
              onBackTap: () => Scaffold.of(context).openDrawer(),
              horizontalPadding: isTablet ? 40 : 16,
              actions: [
                // Filter Icon
                GestureDetector(
                  onTap: () => _showFilterPicker(context, ref, filters),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.tune_rounded, color: AppColors.primary, size: 18),
                  ),
                ),
                const SizedBox(width: 8),
                // FY Chip
                GestureDetector(
                  onTap: () => _showYearPicker(context, ref, filters),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'FY ${filters.financialYear}',
                          style: const TextStyle(color: AppColors.secondary, fontWeight: FontWeight.w800, fontSize: 10),
                        ),
                        const Icon(Icons.keyboard_arrow_down, size: 12, color: AppColors.secondary),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 40 : 16, 
                  vertical: 8
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: isTablet ? 1100 : double.infinity),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                  
                  // Section 1: Core Activity (Compact 2x2 Wide Cards)
                  _buildSectionTitle('Activity Overview', Icons.analytics_rounded),
                  const SizedBox(height: 10),
                  _buildStatsGrid([
                    _StatData('Visits', '42', Icons.location_on_rounded, Colors.blue),
                    _StatData('New Leads', '156', Icons.person_add_rounded, Colors.green),
                    _StatData('Hot Prospects', '18', Icons.local_fire_department_rounded, Colors.orange),
                    _StatData('Pending Appr.', '08', Icons.pending_actions_rounded, Colors.purple),
                  ], isTablet, crossCount: isTablet ? 4 : 2, aspectRatio: 2.1),

                  const SizedBox(height: 25),

                  // Section 2: Performance (Compact 3-Column Row)
                  _buildSectionTitle('Performance Metrics', Icons.speed_rounded),
                  const SizedBox(height: 10),
                  _buildStatsGrid([
                    _StatData('Pending Approval', '24', Icons.history_rounded, Colors.indigo),
                    _StatData('Target', '₹8.5L', Icons.track_changes_rounded, Colors.teal),
                    _StatData('Incentives', '₹12.4K', Icons.currency_rupee_rounded, Colors.amber),
                  ], isTablet, crossCount: isTablet ? 3 : 3, aspectRatio: 1.1, isVertical: true),
                  
                  const SizedBox(height: 25),

                  // Section 3: Daily Schedule
                  _buildFollowUpsSection(isTablet),

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ),
      ])));
  }


  void _showFilterPicker(BuildContext context, WidgetRef ref, DashboardFilters filters) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Filter Period', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.secondary)),
              const SizedBox(height: 20),
              Row(
                children: [
                  _buildModalFilterChip(ref, filters, DashboardPeriod.week, 'Weekly', setModalState),
                  _buildModalFilterChip(ref, filters, DashboardPeriod.month, 'Monthly', setModalState),
                  _buildModalFilterChip(ref, filters, DashboardPeriod.year, 'Yearly', setModalState),
                ],
              ),
              if (filters.period == DashboardPeriod.week) ...[
                const SizedBox(height: 20),
                const Text('Select Week', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54)),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: ['W1', 'W2', 'W3', 'W4', 'W5'].map((w) => _buildModalSubChip(ref, filters, w, setModalState)).toList(),
                ),
              ],
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text('Apply Filters', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModalFilterChip(WidgetRef ref, DashboardFilters filters, DashboardPeriod period, String label, StateSetter setModalState) {
    final isSelected = filters.period == period;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref.read(dashboardFilterProvider.notifier).setPeriod(period);
          setModalState(() {});
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.secondary : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black54, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildModalSubChip(WidgetRef ref, DashboardFilters filters, String label, StateSetter setModalState) {
    final isSelected = filters.subPeriod == label;
    return GestureDetector(
      onTap: () {
        ref.read(dashboardFilterProvider.notifier).setSubPeriod(label);
        setModalState(() {});
      },
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? AppColors.primary : Colors.grey.shade100,
        labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black54, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _showYearPicker(BuildContext context, WidgetRef ref, DashboardFilters filters) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Financial Year', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            ...['2023-24', '2024-25', '2025-26'].map((y) => ListTile(
              title: Text('FY $y', textAlign: TextAlign.center),
              selected: filters.financialYear == y,
              onTap: () {
                ref.read(dashboardFilterProvider.notifier).setFinancialYear(y);
                Navigator.pop(context);
              },
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsGrid(List<_StatData> stats, bool isTablet, {required int crossCount, required double aspectRatio, bool isVertical = false}) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: aspectRatio,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        return GlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          borderRadius: 16,
          child: isVertical
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: stat.color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(stat.icon, color: stat.color, size: 16),
                  ),
                  const SizedBox(height: 4),
                  FittedBox(
                    child: Text(
                      stat.value,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: AppColors.secondary),
                    ),
                  ),
                  Text(
                    stat.title,
                    style: const TextStyle(fontSize: 9, color: AppColors.textSecondary, fontWeight: FontWeight.w700),
                  ),
                ],
              )
            : Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: stat.color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(stat.icon, color: stat.color, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Text(
                            stat.value,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: AppColors.secondary),
                          ),
                        ),
                        Text(
                          stat.title,
                          style: const TextStyle(fontSize: 9, color: AppColors.textSecondary, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title, IconData icon, {Widget? trailing, Widget? titleTrailing}) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.secondary.withValues(alpha: 0.5)),
        const SizedBox(width: 6),
        Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: AppColors.secondary)),
        if (titleTrailing != null) ...[
          const SizedBox(width: 8),
          titleTrailing,
        ],
        const Spacer(),
        if (trailing != null) trailing,
      ],
    );
  }

  Widget _buildFollowUpsSection(bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          'Daily Schedule',
          Icons.calendar_month_rounded,
          titleTrailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '3 Pending',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w900,
                fontSize: 9,
              ),
            ),
          ),
          trailing: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'View All',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w900,
                fontSize: 11,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        _FollowUpCard(
          name: 'Arjun Singh',
          company: 'Arjun Builders Pvt Ltd',
          time: '10:30 AM',
          task: 'Lead Inquiry Follow-up',
          priority: 'High',
          type: Icons.phone_callback_rounded,
        ),
        _FollowUpCard(
          name: 'Priya Sharma',
          company: 'Sharma Interior Solutions',
          time: '01:15 PM',
          task: 'Quotation Discussion',
          priority: 'Medium',
          type: Icons.description_rounded,
        ),
        _FollowUpCard(
          name: 'Vikram Rao',
          company: 'Rao Constructions',
          time: '04:00 PM',
          task: 'Project Site Visit',
          priority: 'Low',
          type: Icons.location_on_rounded,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

}

class _FollowUpCard extends StatefulWidget {
  final String name;
  final String company;
  final String time;
  final String task;
  final String priority;
  final IconData type;

  const _FollowUpCard({
    required this.name,
    required this.company,
    required this.time,
    required this.task,
    required this.priority,
    required this.type,
  });

  @override
  State<_FollowUpCard> createState() => _FollowUpCardState();
}

class _FollowUpCardState extends State<_FollowUpCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Color priorityColor;
    switch (widget.priority.toLowerCase()) {
      case 'high':
        priorityColor = Colors.redAccent;
        break;
      case 'medium':
        priorityColor = AppColors.primary;
        break;
      default:
        priorityColor = Colors.blueAccent;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        borderRadius: 20,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(alpha: 0.05),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(widget.type, color: AppColors.secondary, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: AppColors.secondary,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: priorityColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              widget.priority,
                              style: TextStyle(
                                color: priorityColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 9,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.company,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.assignment_rounded, size: 12, color: AppColors.textSecondary.withValues(alpha: 0.6)),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              widget.task,
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Divider(color: Colors.black12, height: 1, thickness: 0.5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Icon(Icons.access_time_rounded, size: 14, color: AppColors.primary.withValues(alpha: 0.8)),
                      const SizedBox(width: 6),
                      Text(
                        widget.time,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 13,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Radial Speed Dial Menu - Half-Circle Overlay
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      if (_isExpanded) ...[
                        _buildRadialAction(
                          icon: Icons.mail_rounded,
                          color: Colors.orange,
                          angle: 180, // Left
                          radius: 85,
                        ),
                        _buildRadialAction(
                          icon: Icons.sms_rounded,
                          color: Colors.blueAccent,
                          angle: 150,
                          radius: 85,
                        ),
                        _buildRadialAction(
                          icon: Icons.chat_rounded,
                          color: const Color(0xFF25D366),
                          angle: 120,
                          radius: 85,
                        ),
                        _buildRadialAction(
                          icon: Icons.phone_in_talk_rounded,
                          color: Colors.green,
                          angle: 90, // Top
                          radius: 85,
                        ),
                      ],
                      
                      // Main Toggle Button
                      GestureDetector(
                        onTap: () => setState(() => _isExpanded = !_isExpanded),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: _isExpanded ? AppColors.secondary : AppColors.secondary.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (Widget child, Animation<double> animation) {
                              return RotationTransition(
                                turns: animation,
                                child: ScaleTransition(scale: animation, child: child),
                              );
                            },
                            child: Icon(
                              _isExpanded ? Icons.close_rounded : Icons.add_rounded,
                              key: ValueKey(_isExpanded),
                              color: _isExpanded ? Colors.white : AppColors.secondary,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadialAction({
    required IconData icon,
    required Color color,
    required double angle,
    required double radius,
  }) {
    // Calculate X and Y coordinates based on angle
    final double rad = angle * pi / 180;
    final double x = cos(rad) * radius;
    final double y = -sin(rad) * radius; // Negative because Y goes down in Flutter

    return Positioned(
      left: x + 4, // 4 is half the difference to center (48 width vs button size)
      top: y + 4,
      child: _buildFloatingAction(
        icon: icon,
        color: color,
        onTap: () {},
      ),
    );
  }

  Widget _buildFloatingAction({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}

class _StatData {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  _StatData(this.title, this.value, this.icon, this.color);
}
