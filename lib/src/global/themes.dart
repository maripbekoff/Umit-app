import 'package:flutter/material.dart';

enum Theme {
  Light,
  Dark,
  BlueLight,
  BlueDark,
}

final themeData = {
  Theme.Light: ThemeData.light(),
  Theme.Dark: ThemeData.dark(),
  Theme.BlueLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  ),
  Theme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
  ),
};
