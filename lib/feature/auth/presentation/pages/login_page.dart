import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/custom_widgets/custom_text_field.dart';
import '../providers/auth_provider.dart';
import '../providers/auth_state.dart';
import 'otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeMap(
        otpSent: (s) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => OtpPage(email: s.email)),
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
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 320.w,
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
                      // Logo Placeholder (F)
                      Text(
                        'FixCRM',
                        style: GoogleFonts.inter(
                          color: AppColors.primary,
                          fontSize: 42.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      SizedBox(height: 4.h),
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          color: AppColors.textBody,
                        ),
                      ),
                      Text(
                        'Business Relationship Management',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: AppColors.textLight,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      CustomTextField(
                        label: 'Email Address',
                        hint: 'Email Address',
                        controller: _emailController,
                        prefixIcon: null, // Minimalist like screenshot
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        label: 'Password',
                        hint: 'Password',
                        controller: _passwordController,
                        obscureText: true,
                        prefixIcon: null, // Minimalist like screenshot
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 24.w,
                                  height: 24.h,
                                  child: Checkbox(
                                    value: false, 
                                    onChanged: (v) {},
                                    activeColor: AppColors.primary,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Flexible(
                                  child: Text(
                                    'Remember me', 
                                    style: TextStyle(fontSize: 12.sp, color: AppColors.textBody),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 0.w),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Forgot Password?', 
                              style: TextStyle(
                                color: AppColors.primary, 
                                fontSize: 12.sp, 
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      authState.maybeMap(
                        loading: (_) => const CircularProgressIndicator(color: AppColors.primary),
                        orElse: () => ElevatedButton(
                          onPressed: () {
                            if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                              ref.read(authProvider.notifier).login(
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondary, // Navy
                            minimumSize: Size(double.infinity, 54.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(
                            'Sign In →',
                            style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.inter(color: AppColors.textBody, fontSize: 13.sp),
                          children: [
                            const TextSpan(text: "Don't have an account? "),
                            TextSpan(
                              text: "Request Access",
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
