import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData light = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue, brightness: Brightness.dark),
  );
}
