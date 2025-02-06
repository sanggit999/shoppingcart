import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.amber,
        onPrimary: Colors.amber,
        secondary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.red,
        surface: Colors.white,
        onSurface: Colors.black),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true),
  );
}
