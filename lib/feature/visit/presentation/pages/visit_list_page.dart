import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/custom_widgets/responsive_widgets.dart';
import 'add_visit_page.dart';

class VisitListPage extends ConsumerStatefulWidget {
  const VisitListPage({super.key});

  @override
  ConsumerState<VisitListPage> createState() => _VisitListPageState();
}

class _VisitListPageState extends ConsumerState<VisitListPage> {
  final _searchController = TextEditingController();
  String _selectedFilter = 'All';

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
            _buildHeader(context),
            _buildSearchAndFilters(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  isTablet ? 40 : 16,
                  8,
                  isTablet ? 40 : 16,
                  140, // Space for bottom navbar
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: isTablet ? 900 : double.infinity),
                    child: Column(
                      children: [
                        _buildVisitCard(
                          customerName: 'Global Tech Solutions',
                          contactPerson: 'Rahul Verma',
                          location: 'Hitech City, Hyderabad',
                          date: '12 May 2026',
                          time: '11:30 AM',
                          type: 'Meeting',
                          status: 'Completed',
                          outcome: 'Product demo successful. Customer interested in 10 units. Follow up next week.',
                        ),
                        _buildVisitCard(
                          customerName: 'Vertex Industries',
                          contactPerson: 'Amit Shah',
                          location: 'Indiranagar, Bangalore',
                          date: '10 May 2026',
                          time: '02:00 PM',
                          type: 'Follow-up',
                          status: 'Pending',
                          outcome: 'Pending quotation approval from their procurement head.',
                        ),
                        _buildVisitCard(
                          customerName: 'Creative Designs Co.',
                          contactPerson: 'Sana Khan',
                          location: 'Andheri East, Mumbai',
                          date: '08 May 2026',
                          time: '10:00 AM',
                          type: 'Demo',
                          status: 'Completed',
                          outcome: 'Demo done. Asked for technical specifications sheet.',
                        ),
                        _buildVisitCard(
                          customerName: 'Mahindra Logistics',
                          contactPerson: 'Prakash Raj',
                          location: 'Pune Highway, Chakan',
                          date: '05 May 2026',
                          time: '04:15 PM',
                          type: 'Support',
                          status: 'Cancelled',
                          outcome: 'Meeting cancelled due to customer unavailability.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 10.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Visits',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.secondary,
                    letterSpacing: -0.5,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Record of your customer interactions',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddVisitPage()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.add_circle_outline_rounded, color: Colors.white, size: 16.sp),
                  SizedBox(width: 4.w),
                  Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilters() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: Container(
            height: 44.h,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search customer or location...',
                hintStyle: TextStyle(fontSize: 12.sp, color: Colors.black38),
                prefixIcon: Icon(Icons.search_rounded, color: AppColors.secondary.withValues(alpha: 0.5), size: 18.sp),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 36.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            physics: const BouncingScrollPhysics(),
            children: [
              _buildFilterChip('All'),
              _buildFilterChip('Completed'),
              _buildFilterChip('Pending'),
              _buildFilterChip('Cancelled'),
              _buildFilterChip('Follow-up'),
            ],
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.white.withValues(alpha: 0.5),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.secondary,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
              fontSize: 11.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVisitCard({
    required String customerName,
    required String contactPerson,
    required String location,
    required String date,
    required String time,
    required String type,
    required String status,
    required String outcome,
  }) {
    Color statusColor;
    IconData statusIcon;
    switch (status) {
      case 'Completed':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle_outline_rounded;
        break;
      case 'Pending':
        statusColor = Colors.orange;
        statusIcon = Icons.schedule_rounded;
        break;
      case 'Cancelled':
        statusColor = Colors.redAccent;
        statusIcon = Icons.cancel_outlined;
        break;
      default:
        statusColor = Colors.blue;
        statusIcon = Icons.info_outline_rounded;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: GlassCard(
        padding: EdgeInsets.all(16.w),
        borderRadius: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      customerName.substring(0, 1).toUpperCase(),
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w900,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              customerName,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w900,
                                color: AppColors.secondary,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                          Icon(Icons.more_vert_rounded, size: 16.sp, color: Colors.black26),
                        ],
                      ),
                      Text(
                        contactPerson,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                _buildCompactInfo(Icons.calendar_today_rounded, date),
                SizedBox(width: 12.w),
                _buildCompactInfo(Icons.access_time_rounded, time),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Icon(statusIcon, color: statusColor, size: 10.sp),
                      SizedBox(width: 4.w),
                      Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 9.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Icon(Icons.location_on_rounded, size: 13.sp, color: AppColors.primary),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    location,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Outcome:',
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.secondary.withValues(alpha: 0.6),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        type,
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    outcome,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.secondary.withValues(alpha: 0.8),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                _buildActionButton(Icons.phone_rounded, 'Call', Colors.blue),
                SizedBox(width: 8.w),
                _buildActionButton(Icons.directions_rounded, 'Map', Colors.green),
                const Spacer(),
                _buildActionButton(Icons.edit_note_rounded, 'Edit', AppColors.secondary),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 11.sp, color: AppColors.secondary.withValues(alpha: 0.4)),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 12.sp),
          SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w800,
              fontSize: 9.sp,
            ),
          ),
        ],
      ),
    );
  }
}
