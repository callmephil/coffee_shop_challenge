import 'package:coffee_shop_challenge/constants/app_colors.dart';
import 'package:coffee_shop_challenge/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

@immutable
class AppThemes {
  const AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColors.orange,
    scaffoldBackgroundColor: AppColors.backgroundLight2,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLight2,
      foregroundColor: AppColors.black,
      titleTextStyle: AppTextStyles.headlineSmall.copyWith(
        color: AppColors.black,
      ),
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      surfaceTintColor: Colors.transparent,
      color: AppColors.white,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.grey,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundLight2,
      selectedItemColor: AppColors.orange,
      unselectedItemColor: AppColors.lightGrey,
      selectedLabelStyle: AppTextStyles.labelSmall.copyWith(
        color: AppColors.orange,
      ),
      unselectedLabelStyle: AppTextStyles.labelSmall.copyWith(
        color: AppColors.lightGrey,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      headlineSmall: AppTextStyles.headlineSmall,
      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      titleSmall: AppTextStyles.titleSmall,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.labelLarge,
      labelMedium: AppTextStyles.labelMedium,
      labelSmall: AppTextStyles.labelSmall,
    ),
  );
}
