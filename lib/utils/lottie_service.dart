import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../core/constants/app_lotties.dart';

class LottieService {
  static void showSuccess(BuildContext context, String message, {VoidCallback? onConfirm}) {
    _showLottieDialog(
      context,
      AppLotties.success,
      'Success!',
      message,
      Colors.green,
      onConfirm,
    );
  }

  static void showError(BuildContext context, String message, {VoidCallback? onConfirm}) {
    _showLottieDialog(
      context,
      AppLotties.error,
      'Oops!',
      message,
      Colors.red,
      onConfirm,
    );
  }

  static void showNoInternet(BuildContext context, {VoidCallback? onConfirm}) {
    _showLottieDialog(
      context,
      AppLotties.noInternet,
      'No Connection',
      'Please check your internet settings.',
      Colors.orange,
      onConfirm,
    );
  }

  static void _showLottieDialog(
    BuildContext context,
    String lottieUrl,
    String title,
    String message,
    Color color,
    VoidCallback? onConfirm,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        child: Container(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.network(
                lottieUrl,
                height: 150.h,
                repeat: false,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.error_outline,
                  size: 80.sp,
                  color: color,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (onConfirm != null) onConfirm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: const Text('OK'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
