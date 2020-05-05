import 'package:flutter/material.dart';

enum AppTheme { Default, Dark, Adapted }

final themeData = {
  AppTheme.Default: ThemeData(
    fontFamily: 'Gilroy',
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.red,
      elevation: 0,
    ),
    scaffoldBackgroundColor: Color(0xFFF6F6F6),
  ),
  AppTheme.Dark: ThemeData.dark(),
  AppTheme.Adapted: ThemeData(
    primaryColor: Colors.red,
    appBarTheme: AppBarTheme(),
  ),
};
