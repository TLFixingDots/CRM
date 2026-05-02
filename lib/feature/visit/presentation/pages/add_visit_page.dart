import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/app_colors.dart';
import '../../../../utils/custom_widgets/responsive_widgets.dart';
import '../../../../utils/custom_widgets/custom_text_field.dart';
import '../../../../utils/custom_widgets/custom_dropdown.dart';

class AddVisitPage extends ConsumerStatefulWidget {
  const AddVisitPage({super.key});

  @override
  ConsumerState<AddVisitPage> createState() => _AddVisitPageState();
}

class _AddVisitPageState extends ConsumerState<AddVisitPage> {
  // Customer Info
  final _customerNameController = TextEditingController();
  final _contactPersonController = TextEditingController();
  final _phoneController = TextEditingController();

  // Visit Details
  DateTime? _visitDate;
  TimeOfDay? _visitTime;
  String? _visitType;

  // Location
  final _locationController = TextEditingController();

  // Discussion & Outcome
  final _discussionController = TextEditingController();
  final _outcomeController = TextEditingController();

  // Product Details
  final _productController = TextEditingController();

  @override
  void dispose() {
    _customerNameController.dispose();
    _contactPersonController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _discussionController.dispose();
    _outcomeController.dispose();
    _productController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _visitDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: AppColors.secondary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _visitDate) {
      setState(() {
        _visitDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _visitTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: AppColors.secondary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _visitTime) {
      setState(() {
        _visitTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.mainGradient,
        ),
        child: SafeArea(
          bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                isTablet ? 40 : 16,
                24,
                isTablet ? 40 : 16,
                160, // Extra padding for bottom button + nav bar
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: isTablet ? 800 : double.infinity),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                              ),
                              child: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.secondary, size: 20),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Add New Visit',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.secondary,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Record details of your customer visit.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Customer Info Section
                      GlassCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Customer Info', Icons.person_rounded),
                            const SizedBox(height: 16),
                            CustomTextField(
                              label: 'Customer Name',
                              hint: 'Enter customer or company name',
                              controller: _customerNameController,
                              prefixIcon: Icons.business_rounded,
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              label: 'Contact Person',
                              hint: 'Enter contact person name',
                              controller: _contactPersonController,
                              prefixIcon: Icons.person_outline_rounded,
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              label: 'Phone Number',
                              hint: 'Enter 10-digit phone number',
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              prefixIcon: Icons.phone_outlined,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Visit Details Section
                      GlassCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Visit Details', Icons.calendar_today_rounded),
                            const SizedBox(height: 16),
                            
                            // Date & Time Row
                            Row(
                              children: [
                                Expanded(
                                  child: _buildDatePicker(context),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildTimePicker(context),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            
                            CustomDropdown(
                              label: 'Visit Type',
                              hint: 'Select Visit Type',
                              items: const ['Meeting', 'Follow-up', 'Demo', 'Support'],
                              value: _visitType,
                              onChanged: (val) => setState(() => _visitType = val),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Location Section
                      GlassCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Location', Icons.location_on_rounded),
                            const SizedBox(height: 16),
                            CustomTextField(
                              label: 'Address / Location',
                              hint: 'Enter full address or area',
                              controller: _locationController,
                              prefixIcon: Icons.map_outlined,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Product Details
                      GlassCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Product Details', Icons.inventory_2_rounded),
                            const SizedBox(height: 16),
                            CustomTextField(
                              label: 'Product/Service Interested',
                              hint: 'Enter product name',
                              controller: _productController,
                              prefixIcon: Icons.shopping_bag_outlined,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Discussion & Outcome
                      GlassCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Discussion & Outcome', Icons.chat_rounded),
                            const SizedBox(height: 16),
                            _buildMultilineTextField(
                              label: 'Discussion Notes',
                              hint: 'What was discussed?',
                              controller: _discussionController,
                            ),
                            const SizedBox(height: 16),
                            _buildMultilineTextField(
                              label: 'Outcome',
                              hint: 'What was the final outcome or next steps?',
                              controller: _outcomeController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Fixed Bottom Button
            Positioned(
              bottom: 90, // Adjusted for the floating bottom navigation bar
              left: isTablet ? 40 : 16,
              right: isTablet ? 40 : 16,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: isTablet ? 800 : double.infinity),
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondary.withValues(alpha: 0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate and submit
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Submit Visit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.secondary.withValues(alpha: 0.5)),
        const SizedBox(width: 6),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Visit Date',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 11.sp,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        SizedBox(height: 8.h),
        InkWell(
          onTap: () => _selectDate(context),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Theme.of(context).inputDecorationTheme.fillColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).dividerColor.withAlpha(20)),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_month_outlined, color: AppColors.primary, size: 20),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    _visitDate == null 
                        ? 'Select Date' 
                        : DateFormat('dd MMM yyyy').format(_visitDate!),
                    style: TextStyle(
                      color: _visitDate == null ? Colors.black26 : Colors.black87,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          'Visit Time',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 11.sp,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        SizedBox(height: 8.h),
        InkWell(
          onTap: () => _selectTime(context),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Theme.of(context).inputDecorationTheme.fillColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).dividerColor.withAlpha(20)),
            ),
            child: Row(
              children: [
                Icon(Icons.access_time_outlined, color: AppColors.primary, size: 20),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    _visitTime == null 
                        ? 'Select Time' 
                        : _visitTime!.format(context),
                    style: TextStyle(
                      color: _visitTime == null ? Colors.black26 : Colors.black87,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMultilineTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 11.sp,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          maxLines: 4,
          minLines: 3,
          style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15.sp),
          decoration: InputDecoration(
            hintText: hint,
            alignLabelWithHint: true,
          ),
        ),
      ],
    );
  }
}
