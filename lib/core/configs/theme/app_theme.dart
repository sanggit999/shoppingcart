import 'package:flutter/material.dart';
import 'package:shoppingcart/core/configs/theme/custom_theme/app_bar_theme_custom.dart';
import 'package:shoppingcart/core/configs/theme/custom_theme/elevated_button_theme_data_custom.dart';

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
      onSurface: Colors.black,
    ),
    appBarTheme: AppBarThemeCustom.appBarThemeCustom,
    elevatedButtonTheme:
        ElevatedButtonThemeDataCustom.elevatedButtonThemeDataCustom,
  );
}
