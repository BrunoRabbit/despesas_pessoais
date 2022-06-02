import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  toggleSwitch(bool isDarkTheme) {
    themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
