import 'package:flutter/material.dart';

class AppColors {
  // Core Colors
  static const Color primary = Color(0xFFE67E22); // Brighter Brand Orange
  static const Color secondary = Color(0xFF2C3E50); // Dark Navy
  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFE57373);

  // Background Gradient Colors
  static const Color grad1 = Color(0xFFFDF5E6);
  static const Color grad2 = Color(0xFFF5EFE6);
  static const Color grad3 = Color(0xFFEADBC8);

  // Background & Surface
  static const Color background = Color(0xFFFDF5E6);
  static const Color surface = Colors.white;
  static const Color inputBg = Colors.white;
  static const Color border = Color(0xFFE2E8F0);

  // Text Colors
  static const Color textPrimary = Color(0xFF1D1D1D);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textLight = Color(0xFF9E9E9E);

  // Reusable Background Gradient
  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [grad1, grad2, grad3],
  );

  static LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primary.withValues(alpha: 0.8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Glass UI Colors
  static Color glassBackground = Colors.white.withValues(alpha: 0.4);
  static Color glassBorder = Colors.white.withValues(alpha: 0.7);
}
