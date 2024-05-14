import 'package:flutter/material.dart';
import 'package:simple_budget/utils/theme/dark_theme.dart';
import 'package:simple_budget/utils/theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  bool isDarkMode = false;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightTheme) {
      themeData = darkTheme;
    } else {
      themeData = themeData;
    }
  }

  @override
  dispose();
}
