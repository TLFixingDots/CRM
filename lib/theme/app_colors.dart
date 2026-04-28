import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette (Matched to Screenshot)
  static const Color primary = Color(0xFFF26522); // Vibrant Orange
  static const Color secondary = Color(0xFF1D263B); // Deep Navy (Buttons)
  static const Color accent = Color(0xFFF26522); // Keeping consistent for now
  
  // Background & Surface
  static const Color background = Color(0xFFFEFAF4); // Primary background
  static const Color bgTop = Color(0xFFFEFAF4); // Very light warm cream
  static const Color bgBottom = Color(0xFFF9E7CF); // Warm beige/tan
  static const Color surface = Colors.white;
  static const Color inputBg = Colors.white;
  static const Color border = Color(0xFFEEEEEE);
  
  // Text Colors
  static const Color textHeading = Color(0xFF1D1D1D);
  static const Color textBody = Color(0xFF666666);
  static const Color textLight = Color(0xFF9E9E9E);
  static const Color error = Color(0xFFE57373);

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [bgTop, bgBottom],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
