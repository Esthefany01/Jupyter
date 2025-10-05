import 'package:flutter/material.dart';

class AppTheme {
  static Color error = const Color(0xFFff5b5b);
  static Color warning = const Color(0xFFF3B200);
  static Color success = const Color(0xFF9ED747);
  static Color information = const Color(0xFF3C4C70);
  static Color message = const Color(0xFF0036B5);

  static ColorScheme colorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF637E65), //669c35 - verde mais vivo
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFEF9A9A),
    onSecondary: Color(0xFF1A1A1A),
    error: Color(0xFFCB0404),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFFFFFFFF),
    primaryContainer: Color(0XFFCFB897),
    onPrimaryContainer: Color(0xFF1A1A1A),
    secondaryContainer: Color(0xFFFD725B),
    onSecondaryContainer: Color(0xFF1A1A1A),
  );

  static ColorScheme colorSchemeDark = const ColorScheme(
    brightness: Brightness.dark,
    // primary: Color(0xFF3D8D7A),
    primary: Color(0xFF425F57),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFF48FB1),
    onSecondary: Color(0xFF3D1E23),
    error: Color(0xFFFF6F6F),
    onError: Color(0xFF690000),
    surface: Color(0xFFC0C0C0),
    onSurface: Color(0xFFC0C0C0),
    primaryContainer: Color(0XFFCFB897),
    onPrimaryContainer: Color(0xFF1A1A1A),
    secondaryContainer: Color(0xFFFD725B),
    onSecondaryContainer: Color(0xFF1A1A1A),
  );
}
