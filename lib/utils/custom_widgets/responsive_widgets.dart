import 'dart:ui';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blur;
  final EdgeInsets? padding;

  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius = 30,
    this.blur = 15,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding ?? const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.glassBackground,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: AppColors.glassBorder,
              width: 1.2,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class ResponsiveScaffold extends StatelessWidget {
  final Widget child;
  final double maxContentWidth;
  final Widget? drawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const ResponsiveScaffold({
    super.key,
    required this.child,
    this.maxContentWidth = 550,
    this.drawer,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    return Scaffold(
      key: scaffoldKey,
      drawer: drawer,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.mainGradient,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 40 : 20,
                vertical: 20,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isTablet ? maxContentWidth : 420,
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
