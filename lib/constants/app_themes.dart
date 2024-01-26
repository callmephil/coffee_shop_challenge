import 'package:flutter/material.dart';

@immutable
class AppThemes {
  const AppThemes._();

  // init material theme

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
