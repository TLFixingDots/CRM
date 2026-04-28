import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../theme/app_colors.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              _buildHeader(),
              SizedBox(height: 24.h),
              _buildWelcomeSection(),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.notes, color: AppColors.textHeading, size: 28.w),
        Row(
          children: [
            Icon(Icons.search, color: AppColors.textBody, size: 24.w),
            SizedBox(width: 20.w),
            Icon(Icons.notifications_none, color: AppColors.textBody, size: 24.w),
            SizedBox(width: 20.w),
            const CircleAvatar(radius: 18, child: Icon(Icons.person)),
          ],
        ),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome,', style: TextStyle(fontSize: 14.sp, color: AppColors.textBody)),
        Text(
          'CRM Specialist',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.textHeading),
        ),
      ],
    );
  }
}
