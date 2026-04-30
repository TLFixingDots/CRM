import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/router/app_router.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/alert_service.dart';
import '../../../../utils/loading_overlay.dart';
import '../../../../utils/lottie_service.dart';
import '../../../../utils/custom_widgets/responsive_widgets.dart';
import '../providers/auth_provider.dart';
import '../providers/auth_state.dart';

class OtpPage extends ConsumerStatefulWidget {
  final String identifier;
  const OtpPage({super.key, required this.identifier});

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
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.maybeMap(loading: (_) => true, orElse: () => false)) {
        LoadingOverlay.show(context);
      } else if (previous?.maybeMap(loading: (_) => true, orElse: () => false) ?? false) {
        LoadingOverlay.hide(context);
      }

      next.maybeMap(
        success: (_) {
          LottieService.showSuccess(
            context, 
            'Your identity has been verified.',
            onConfirm: () => context.go(AppRouter.root),
          );
        },
        error: (e) {
          LottieService.showError(context, e.message);
        },
        orElse: () {},
      );
    });

    final authState = ref.watch(authProvider);

    final defaultPinTheme = PinTheme(
      width: isTablet ? 60 : 45,
      height: isTablet ? 65 : 50,
      textStyle: TextStyle(
        fontSize: isTablet ? 22 : 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primary, width: 2),
        color: Colors.white,
      ),
    );

    return ResponsiveScaffold(
      maxContentWidth: 550,
      child: Column(
        children: [
          GlassCard(
            borderRadius: isTablet ? 40 : 30,
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 40 : 24, 
              vertical: isTablet ? 50 : 40
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.security_outlined,
                    size: isTablet ? 48 : 36,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: isTablet ? 32 : 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Enter the 6-digit code sent to\n${widget.identifier}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: isTablet ? 16 : 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),

                Pinput(
                  length: 6,
                  controller: _pinController,
                  focusNode: _focusNode,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  pinAnimationType: PinAnimationType.fade,
                  onCompleted: (pin) {
                    ref.read(authProvider.notifier).verifyOtp(
                      widget.identifier,
                      pin,
                    );
                  },
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: isTablet ? 60 : 54,
                  child: ElevatedButton(
                    onPressed: authState.maybeMap(
                      loading: (_) => null,
                      orElse: () => () {
                        if (_pinController.text.length == 6) {
                          ref.read(authProvider.notifier).verifyOtp(
                            widget.identifier,
                            _pinController.text,
                          );
                        } else {
                          AlertService.showWarning(context, 'Please enter a 6-digit OTP');
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
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: isTablet ? 18 : 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                TextButton(
                  onPressed: () {
                    ref.read(authProvider.notifier).sendOtp(widget.identifier);
                  },
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back, size: 18),
            label: const Text('Back to Login'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
