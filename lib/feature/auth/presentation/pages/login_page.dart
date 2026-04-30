import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/alert_service.dart';
import '../../../../utils/loading_overlay.dart';
import '../../../../utils/lottie_service.dart';
import '../../../../utils/custom_widgets/responsive_widgets.dart';
import '../providers/auth_provider.dart';
import '../providers/auth_state.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mobileController = TextEditingController();
  bool _isEmailLogin = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.maybeMap(loading: (_) => true, orElse: () => false)) {
        LoadingOverlay.show(context);
      } else if (previous?.maybeMap(loading: (_) => true, orElse: () => false) ?? false) {
        LoadingOverlay.hide(context);
      }

      next.maybeMap(
        otpSent: (s) {
          AlertService.showSuccess(context, 'OTP sent successfully');
          context.push(AppRouter.otp, extra: s.identifier);
        },
        success: (_) {
          LottieService.showSuccess(
            context, 
            'You have successfully logged in.',
            onConfirm: () => context.go(AppRouter.root),
          );
        },
        error: (e) {
          if (e.message.contains('Connection')) {
            LottieService.showNoInternet(context);
          } else {
            LottieService.showError(context, e.message);
          }
        },
        orElse: () {},
      );
    });

    final authState = ref.watch(authProvider);

    return ResponsiveScaffold(
      maxContentWidth: 550,
      child: Column(
        children: [
          // Logo Section with Atmospheric Glow
          _buildLogoHeader(isTablet),
          SizedBox(height: isTablet ? 50 : 30),

          // Reusable Glass Card
          GlassCard(
            borderRadius: isTablet ? 40 : 30,
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 40 : 24, 
              vertical: isTablet ? 50 : 35
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: isTablet ? 26 : 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Enter your details to sign in',
                  style: TextStyle(
                    fontSize: isTablet ? 14 : 13,
                    color: Colors.black45,
                  ),
                ),
                SizedBox(height: isTablet ? 35 : 25),

                // Toggle
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      _buildToggleItem('Email', _isEmailLogin, isTablet, () => setState(() => _isEmailLogin = true)),
                      _buildToggleItem('Mobile', !_isEmailLogin, isTablet, () => setState(() => _isEmailLogin = false)),
                    ],
                  ),
                ),
                SizedBox(height: isTablet ? 30 : 20),

                if (_isEmailLogin) ...[
                  _buildLabel('Email Address', isTablet),
                  _buildInputBox(
                    controller: _emailController,
                    icon: Icons.email_outlined,
                    hint: 'name@company.com',
                    keyboardType: TextInputType.emailAddress,
                    isTablet: isTablet,
                  ),
                  SizedBox(height: isTablet ? 24 : 18),
                  _buildLabel('Password', isTablet),
                  _buildInputBox(
                    controller: _passwordController,
                    icon: Icons.lock_outline,
                    hint: '........',
                    obscureText: true,
                    isTablet: isTablet,
                  ),
                ] else ...[
                  _buildLabel('Mobile Number', isTablet),
                  _buildInputBox(
                    controller: _mobileController,
                    icon: Icons.phone_android_outlined,
                    hint: 'Enter 10 digit number',
                    keyboardType: TextInputType.phone,
                    isTablet: isTablet,
                  ),
                ],

                SizedBox(height: isTablet ? 24 : 18),
                
                // Action Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _rememberMe = !_rememberMe),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.black26, width: 1.2),
                                color: _rememberMe ? AppColors.primary : Colors.transparent,
                              ),
                              child: _rememberMe 
                                ? const Icon(Icons.check, size: 14, color: Colors.white) 
                                : null,
                            ),
                            const SizedBox(width: 8),
                            const Flexible(
                              child: Text(
                                'Remember me',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12, color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: isTablet ? 15 : 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: isTablet ? 40 : 25),

                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  height: isTablet ? 60 : 54,
                  child: ElevatedButton(
                    onPressed: authState.maybeMap(
                      loading: (_) => null,
                      orElse: () => () {
                        if (_isEmailLogin) {
                          final email = _emailController.text.trim();
                          final password = _passwordController.text.trim();
                          final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          
                          if (email.isEmpty || !emailRegex.hasMatch(email)) {
                            AlertService.showError(context, 'Please enter a valid email address');
                            return;
                          }
                          if (password.isEmpty) {
                            AlertService.showError(context, 'Please enter your password');
                            return;
                          }
                          ref.read(authProvider.notifier).login(email, password);
                        } else {
                          final mobile = _mobileController.text.trim();
                          if (mobile.isEmpty || mobile.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(mobile)) {
                            AlertService.showError(context, 'Please enter a valid 10-digit mobile number');
                            return;
                          }
                          ref.read(authProvider.notifier).sendOtp(mobile);
                        }
                      },
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _isEmailLogin ? 'Sign In' : 'Send OTP',
                          style: TextStyle(
                            fontSize: isTablet ? 20 : 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: isTablet ? 24 : 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: isTablet ? 60 : 35),
          // Footer
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(color: Colors.black54, fontSize: isTablet ? 15 : 13),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Request Access',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: isTablet ? 15 : 13,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildLogoHeader(bool isTablet) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: isTablet ? 250 : 200,
          height: 80,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.1),
                blurRadius: 60,
                spreadRadius: 10,
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              'FixCRM',
              style: TextStyle(
                fontSize: isTablet ? 48 : 36,
                fontWeight: FontWeight.w900,
                color: AppColors.primary,
                letterSpacing: -1.2,
              ),
            ),
            Text(
              'Business Relationship Management',
              style: TextStyle(
                fontSize: isTablet ? 14 : 12,
                color: Colors.black45,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildToggleItem(String label, bool isSelected, bool isTablet, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: isTablet ? 10 : 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? AppColors.primary : Colors.black45,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: isTablet ? 15 : 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, bool isTablet) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isTablet ? 16 : 14,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildInputBox({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    required bool isTablet,
    bool obscureText = false,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: isTablet ? 16 : 14, color: Colors.black87),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black26, fontSize: isTablet ? 14 : 13),
          prefixIcon: Icon(icon, color: AppColors.primary, size: isTablet ? 22 : 18),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: isTablet ? 18 : 14, horizontal: 16),
        ),
      ),
    );
  }
}
