import 'package:flutter/material.dart';

enum AppTheme { Default, Dark }

enum AdaptedTheme { Adapted }

final themeData = {
  AppTheme.Default: ThemeData(
    fontFamily: 'Gilroy',
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
    ),
  ),
  AppTheme.Dark: ThemeData.dark(),
};

final adaptedThemeData = {
  AdaptedTheme.Adapted: ThemeData(
    primaryColor: Colors.red,
  )
};
