import 'package:coffee_shop_challenge/constants/constants.dart';
import 'package:coffee_shop_challenge/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Caffeine',
      theme: AppThemes.lightTheme,
      // TODO: maybe dark theme
      darkTheme: AppThemes.lightTheme,
      routerConfig: AppRoutes.routerConfig,
    );
  }
}
