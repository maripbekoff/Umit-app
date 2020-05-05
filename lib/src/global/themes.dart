import 'package:flutter/material.dart';

enum AppTheme { Default, Dark, Adapted }

final themeData = {
  AppTheme.Default: ThemeData(
      fontFamily: 'Gilroy',
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Color(0xFFF6F6F6),
      primaryColor: Color(0xFF0097FF),
      accentColor: Colors.white,
      primarySwatch: customColor,
      cardColor: Colors.black),
  AppTheme.Dark: ThemeData.dark(),
  AppTheme.Adapted: ThemeData(
    fontFamily: "Gilroy",
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Color(0xFFFFFF00),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
    backgroundColor: Color(0xFFFFFF00),
    primaryColor: Color(0xFF0000FF),
    accentColor: Color(0xFF0000FF),
    cardColor: Color(0xFFFFFF00),
    unselectedWidgetColor: Colors.black,
    primarySwatch: customAdaptedColor,
  ),
};

Map<int, Color> primaryAdaptedSwatchColor = {
  50: Color.fromRGBO(0, 255, 255, .1),
  100: Color.fromRGBO(0, 255, 255, .2),
  200: Color.fromRGBO(0, 255, 255, .3),
  300: Color.fromRGBO(0, 255, 255, .4),
  400: Color.fromRGBO(0, 255, 255, .5),
  500: Color.fromRGBO(0, 255, 255, .6),
  600: Color.fromRGBO(0, 255, 255, .7),
  700: Color.fromRGBO(0, 255, 255, .8),
  800: Color.fromRGBO(0, 255, 255, .9),
  900: Color.fromRGBO(0, 255, 255, 1),
};

MaterialColor customAdaptedColor =
    MaterialColor(0xFF0000FF, primaryAdaptedSwatchColor);

Map<int, Color> primaryDefaulSwatchColor = {
  50: Color.fromRGBO(0, 151, 255, .1),
  100: Color.fromRGBO(0, 151, 255, .2),
  200: Color.fromRGBO(0, 151, 255, .3),
  300: Color.fromRGBO(0, 151, 255, .4),
  400: Color.fromRGBO(0, 151, 255, .5),
  500: Color.fromRGBO(0, 151, 255, .6),
  600: Color.fromRGBO(0, 151, 255, .7),
  700: Color.fromRGBO(0, 151, 255, .8),
  800: Color.fromRGBO(0, 151, 255, .9),
  900: Color.fromRGBO(0, 151, 255, 1),
};

MaterialColor customColor = MaterialColor(0xFF0097FF, primaryDefaulSwatchColor);
