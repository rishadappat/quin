import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    brightness: Brightness.dark,
  );
}

ColorScheme colorScheme =
    ColorScheme.fromSeed(seedColor: const Color(0xFF4374D1));
