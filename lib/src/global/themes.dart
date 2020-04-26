import 'package:flutter/material.dart';

enum AppTheme { Light, Dark, BlueLight, BlueDark }

final themeData = {
  AppTheme.Light: ThemeData.light(),
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
