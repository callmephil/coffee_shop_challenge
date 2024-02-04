import 'package:coffee_shop_challenge/constants/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class AppTextStyles {
  const AppTextStyles._();

  static const String fontFamily = 'Sora';

  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w100,
    fontSize: 96,
    height: 1.25,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w200,
    fontSize: 60,
    height: 1.25,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 48,
    height: 1.25,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 34,
    height: 1.25,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 24,
    height: 1.25,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1.25,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 1.25,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 14,
    height: 1.25,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 12,
    height: 1.25,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.25,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.25,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.25,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 1.25,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 1.25,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 10,
  );
}

extension TextFromContextExtension on BuildContext {
  /// [AppTextStyles]
  TextTheme get textStyle => Theme.of(this).textTheme;

  bool get isLTR => Directionality.of(this) == TextDirection.ltr;
}

extension TextStyleExtension on TextStyle {
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);
  // Colors
  TextStyle get white => copyWith(color: AppColors.white);
  TextStyle get lightGrey => copyWith(color: AppColors.lightGrey);
  TextStyle get orange => copyWith(color: AppColors.orange);
}
