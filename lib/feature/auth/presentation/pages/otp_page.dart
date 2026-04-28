import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../../theme/app_colors.dart';
import '../providers/auth_provider.dart';
import '../providers/auth_state.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class OtpPage extends ConsumerStatefulWidget {
  final String email;
  const OtpPage({super.key, required this.email});

  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define Pin Themes
    final defaultPinTheme = PinTheme(
      width: 45.w,
      height: 56.h,
      textStyle: GoogleFonts.inter(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textHeading,
      ),
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.transparent),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primary, width: 2),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
        border: Border.all(color: AppColors.primary.withAlpha(50)),
      ),
    );

    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeMap(
        success: (_) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const DashboardPage()),
            (route) => false,
          );
        },
        error: (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
        },
        orElse: () {},
      );
    });

    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 340.w,
                  padding: EdgeInsets.all(32.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(15),
                        blurRadius: 30,
                        offset: const Offset(0, 15),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Verify OTP',
                        style: GoogleFonts.inter(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textHeading,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Enter the 6-digit code sent to',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13.sp, color: AppColors.textBody),
                      ),
                      Text(
                        widget.email,
                        style: TextStyle(fontSize: 13.sp, color: AppColors.primary, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 32.h),
                      Pinput(
                        length: 6,
                        controller: _pinController,
                        focusNode: _focusNode,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        showCursor: true,
                        onCompleted: (pin) {
                          ref.read(authProvider.notifier).verifyOtp(widget.email, pin);
                        },
                      ),
                      SizedBox(height: 32.h),
                      authState.maybeMap(
                        loading: (_) => const CircularProgressIndicator(color: AppColors.primary),
                        orElse: () => ElevatedButton(
                          onPressed: () {
                            if (_pinController.text.length == 6) {
                              ref.read(authProvider.notifier).verifyOtp(
                                widget.email, 
                                _pinController.text,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondary, // Navy
                            minimumSize: Size(double.infinity, 54.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(
                            'Verify Account →',
                            style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.inter(color: AppColors.textBody, fontSize: 13.sp),
                          children: [
                            const TextSpan(text: "Didn't receive code? "),
                            TextSpan(
                              text: "Resend",
                              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
