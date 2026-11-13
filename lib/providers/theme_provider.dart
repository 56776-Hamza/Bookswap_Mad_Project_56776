import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// ThemeProvider: Manages app-wide Light / Dark Mode theme switching (Screen 12)
/// ---------------------------------------------------------------------------
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  /// Toggles theme mode based on switch value (true for Dark Mode, false for Light Mode)
  void toggleTheme(bool isOn) {
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // Rebuilds dependent widgets across the app
  }

  /// Directly sets theme mode
  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
