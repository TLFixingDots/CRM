import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/custom_widgets/responsive_widgets.dart';

class LeadListPage extends ConsumerStatefulWidget {
  const LeadListPage({super.key});

  @override
  ConsumerState<LeadListPage> createState() => _LeadListPageState();
}

class _LeadListPageState extends ConsumerState<LeadListPage> {
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
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: _isSearching ? _buildFilterChips() : const SizedBox.shrink(),
            ),
            Expanded(
              child: _buildLeadList(isTablet),
            ),
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
          'Leads',
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
        _buildCircleAction(Icons.add_rounded, () => context.push(AppRouter.leadForm), isPrimary: true),
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
                hintText: 'Search leads...',
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
    final filters = ['All', 'Hot', 'New', 'Contacted', 'Pending'];
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

  Widget _buildLeadList(bool isTablet) {
    // Dummy data for now
    final List<Map<String, String>> dummyLeads = [
      {
        'name': 'Rajesh Kumar', 
        'company': 'Kumar Tech Solutions', 
        'status': 'Hot', 
        'priority': 'High', 
        'phone': '+91 9876543210',
        'email': 'rajesh@kumartech.com',
        'category': 'Construction Machinery',
        'model': 'Excavator XP-200',
        'date': '24 May 2024',
        'source': 'Web Inquiry',
        'progress': '0.7', // 70% progress
      },
      {
        'name': 'Sneha Patil', 
        'company': 'Patil Enterprises', 
        'status': 'New', 
        'priority': 'Medium', 
        'phone': '+91 9123456789',
        'email': 'sneha@patil.in',
        'category': 'Industrial Tools',
        'model': 'Power Drill Pro-X',
        'date': '20 May 2024',
        'source': 'Referral',
        'progress': '0.2',
      },
      {
        'name': 'Amit Shah', 
        'company': 'Shah & Sons', 
        'status': 'Contacted', 
        'priority': 'Low', 
        'phone': '+91 8888888888',
        'email': 'amit@shahandsons.com',
        'category': 'Generator Sets',
        'model': 'VoltGuard 5000',
        'date': '18 May 2024',
        'source': 'Direct Call',
        'progress': '0.4',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
      itemCount: dummyLeads.length,
      itemBuilder: (context, index) {
        final lead = dummyLeads[index];
        return _buildLeadCard(context, lead);
      },
    );
  }

  Widget _buildLeadCard(BuildContext context, Map<String, String> lead) {
    Color statusColor;
    switch (lead['status']?.toLowerCase()) {
      case 'hot':
        statusColor = Colors.redAccent;
        break;
      case 'new':
        statusColor = Colors.green;
        break;
      default:
        statusColor = AppColors.primary;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: GlassCard(
        padding: const EdgeInsets.all(0),
        borderRadius: 24,
        child: Column(
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Row(
                children: [
                  _buildLeadAvatar(lead['name']!),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lead['name']!,
                          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: AppColors.secondary),
                        ),
                        Text(
                          lead['company']!,
                          style: const TextStyle(color: AppColors.textSecondary, fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  _buildStatusBadge(lead['status']!, statusColor),
                ],
              ),
            ),
            
            // Client & Product Info Sections
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildInfoRow(
                    Icons.contact_mail_rounded, 
                    'Client Details', 
                    '${lead['phone']}  •  ${lead['email']}',
                    Colors.blueGrey
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(height: 1, thickness: 0.5, color: Colors.black12),
                  ),
                  _buildInfoRow(
                    Icons.inventory_2_rounded, 
                    'Product Interest', 
                    '${lead['category']}  /  ${lead['model']}',
                    AppColors.primary
                  ),
                ],
              ),
            ),

            // Bottom Actions Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.05),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today_rounded, size: 12, color: AppColors.textSecondary),
                  const SizedBox(width: 6),
                  Text(lead['date']!, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary, fontWeight: FontWeight.w700)),
                  const Spacer(),
                  _buildActionIcon(
                    Icons.request_quote_rounded, 
                    Colors.deepOrange,
                    onTap: () => context.push(AppRouter.createQuotation),
                  ),
                  const SizedBox(width: 10),
                  _buildActionIcon(Icons.call_rounded, Colors.green),
                  const SizedBox(width: 10),
                  _buildActionIcon(Icons.chat_rounded, const Color(0xFF25D366)),
                  const SizedBox(width: 10),
                  _buildActionIcon(Icons.edit_note_rounded, AppColors.secondary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 16, color: color),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.toUpperCase(),
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: color, letterSpacing: 0.5),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLeadAvatar(String name) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.secondary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          name[0].toUpperCase(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.secondary),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 9,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, Color color, {double size = 18, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: size),
      ),
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
          boxShadow: isPrimary ? [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ] : null,
        ),
        child: Icon(icon, color: isPrimary ? Colors.white : AppColors.secondary, size: 22),
      ),
    );
  }
}
