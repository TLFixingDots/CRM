import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertService {
  static void showSuccess(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      Colors.green.shade600,
      Icons.check_circle_outline,
    );
  }

  static void showError(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      Colors.red.shade600,
      Icons.error_outline,
    );
  }

  static void showWarning(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      Colors.orange.shade700,
      Icons.warning_amber_rounded,
    );
  }

  static void _showSnackBar(
    BuildContext context,
    String message,
    Color backgroundColor,
    IconData icon,
  ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        margin: EdgeInsets.all(16.w),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
