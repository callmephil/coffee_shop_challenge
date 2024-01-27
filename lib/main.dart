import 'package:coffee_shop_challenge/constants/constants.dart';
import 'package:coffee_shop_challenge/i18n/strings.g.dart';
import 'package:coffee_shop_challenge/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// removes the # from the url
  setPathUrlStrategy();

  LocaleSettings.useDeviceLocale();

  runApp(TranslationProvider(child: const MyApp()));
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
      locale: TranslationProvider.of(context).flutterLocale, // use provider
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      // TODO: maybe dark theme
      darkTheme: AppThemes.lightTheme,
      routerConfig: AppRoutes.routerConfig,
    );
  }
}
