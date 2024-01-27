import 'package:coffee_shop_challenge/constants/constants.dart';
import 'package:coffee_shop_challenge/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// removes the # from the url
  setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    AppAssets.preCacheAssets(context);
  }

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
