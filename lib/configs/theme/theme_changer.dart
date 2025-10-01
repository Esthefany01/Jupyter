import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jupyter/configs/theme/app_theme.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeChanger() {
    final window = PlatformDispatcher.instance;

    window.onPlatformBrightnessChanged = () => switchModel();

    _themeData = _buildTheme(
      window.platformBrightness,
      window.platformBrightness == Brightness.light ? AppTheme.colorScheme : AppTheme.colorSchemeDark,
    );
  }

  late ThemeData _themeData;

  ThemeData get theme => _themeData;
  Brightness get brightness => _themeData.brightness;
  bool get isDarkMode => brightness == Brightness.dark;

  /// Alterna entre modo claro e escuro
  void switchModel() {
    final newBrightness = isDarkMode ? Brightness.light : Brightness.dark;
    _updateTheme(newBrightness);
    notifyListeners();
  }

  /// Atualiza o tema com base no brilho fornecido
  void _updateTheme(Brightness brightness) {
    final colorScheme = brightness == Brightness.light ? AppTheme.colorScheme : AppTheme.colorSchemeDark;
    _themeData = _buildTheme(brightness, colorScheme);
  }

  /// Constrói o tema com base no brilho e esquema de cores
  ThemeData _buildTheme(Brightness brightness, ColorScheme colorScheme) {
    return ThemeData(
      fontFamily: 'Quicksand',
      brightness: brightness,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
      ),
    );
  }
}
