import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String  locale = "en";

  bool  get isDark => themeMode == ThemeMode.dark;

  void changeThemeMode(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }

  void changeLocale(String loc){
    locale = loc;
    notifyListeners();
  }

}
