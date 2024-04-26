import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLang = 'en';
  ThemeMode appTheme = ThemeMode.light;

  void changeAppLang(String newLang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (appLang == newLang) {
      return;
    }
    appLang = newLang;
    prefs.setString('appLang', appLang);
    notifyListeners();
  }

  void changeAppTheme(ThemeMode newTheme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    prefs.setString('appTheme', newTheme == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
}
