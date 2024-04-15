import 'package:flutter/material.dart';
import 'package:project/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData= lightMode;
  ThemeData get themedata => _themeData;
  bool get isDarkMode => _themeData == darkMode;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if (_themeData == lightMode) {
      themeData = darkMode;
    }else {
      themeData = lightMode;
    }
  }
}