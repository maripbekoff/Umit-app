import 'package:flutter/material.dart';

enum AppTheme { Default, Dark, BlueLight, BlueDark }

final themeData = {
  AppTheme.Default: ThemeData(
    fontFamily: 'Gilroy',
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
    ),
  ),
  AppTheme.Dark: ThemeData.dark(),
  AppTheme.BlueLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  ),
  AppTheme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
  ),
};