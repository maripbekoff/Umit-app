import 'package:flutter/material.dart';

enum AppTheme { Default, Dark }

enum AdaptedTheme { Adapted }

final themeData = {
  AppTheme.Default: ThemeData(
    fontFamily: 'Gilroy',
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Color(0xFFF6F6F6),
      elevation: 0,
    ),
    scaffoldBackgroundColor: Color(0xFFF6F6F6),
  ),
  AppTheme.Dark: ThemeData.dark(),
};

final adaptedThemeData = {
  AdaptedTheme.Adapted: ThemeData(
    primaryColor: Colors.red,
  )
};
