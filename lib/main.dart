import 'package:coffee_shop_challenge/constants/constatns.dart';
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
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      routerConfig: AppRoutes.routerConfig,
    );
  }
}
