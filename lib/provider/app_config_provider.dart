import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLang = 'en';
  ThemeMode appTheme = ThemeMode.light;

  void changeAppLang(String newLang) {
    if (appLang == newLang) {
      return;
    }
    appLang = newLang;
    notifyListeners();
  }

  void changeAppTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
}
