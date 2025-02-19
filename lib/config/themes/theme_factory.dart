import 'package:flutter/material.dart';

enum Theme {
  light,
  dark,
  system;
}

class ThemeFactory {
  static ThemeData createTheme(Theme theme) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      useMaterial3: true,
    );
  }
}
