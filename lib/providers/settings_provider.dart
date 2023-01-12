import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  String currentLocale = "en";
  ThemeMode currentTheme = ThemeMode.light;

  changeCurrentLocale (String newLocale){
    currentLocale = newLocale;
    notifyListeners();
  }

  changeCurrentTheme (ThemeMode newTheme){
    currentTheme = newTheme;
    notifyListeners();
  }

}