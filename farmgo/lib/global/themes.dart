import 'package:flutter/material.dart';

enum AppThemes { dark, light }

final appThemeData = {
  AppThemes.dark: ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color.fromRGBO(27, 35, 42, 1),
    primaryColor: const Color.fromRGBO(27, 35, 42, 1),
    appBarTheme: const AppBarTheme(color: Color.fromRGBO(27, 35, 42, 1)),
  ),
  AppThemes.light: ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    appBarTheme: const AppBarTheme(color:  Color.fromRGBO(255, 255, 255, 1), foregroundColor: Colors.black),
    ),
};
