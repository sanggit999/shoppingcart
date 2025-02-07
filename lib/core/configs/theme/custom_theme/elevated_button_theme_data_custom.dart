import 'package:flutter/material.dart';

class ElevatedButtonThemeDataCustom {
  ElevatedButtonThemeDataCustom._();
  static ElevatedButtonThemeData elevatedButtonThemeDataCustom =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber.shade800,
        elevation: 0,
        textStyle: const TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
  );
}
