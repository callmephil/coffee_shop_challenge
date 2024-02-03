import 'package:flutter/material.dart' show Color, immutable;

@immutable
class AppColors {
  const AppColors._();

  /// primary color
  static const Color orange = Color(0xFFC67C4E);
  static const Color orangeLight = Color(0xFFFFF5EE);
  static const Color yellowDark = Color(0xFFFBBE21);
  static const Color navyBlue = Color(0xFF2F4B4E);

  static const Color black = Color(0xFF2F2D2C);
  static const Color lightGrey = Color(0xFF9B9B9B);
  static const Color darkGrey = Color(0xFF808080);
  static const Color white = Color(0xFFFFFFFF);

  static const Color backgroundLight = Color(0xFFE4EDFA);
  static const Color backgroundLight2 = Color(0xFFF9F9F9);
  static const Color backgroundDark = Color(0xFF313131);
  // Can't figure out what is it gradient?
  // static const Color backgroundDark = Color(0xFF)
}
