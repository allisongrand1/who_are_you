import 'package:flutter/material.dart';

enum Theme {
  light,
  dark,
  system;
}

class ThemeFactory {
  static ThemeData createTheme(Theme theme) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }
}
