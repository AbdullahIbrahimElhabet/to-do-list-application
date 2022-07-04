import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  String currebtLanguag = "en";
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode mode) async {
    themeMode = mode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("theme", mode == ThemeMode.light ? "ligth" : "dark");
    notifyListeners();
  }

  void changeLanguage(String newLanguage) async {
    currebtLanguag = newLanguage;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", newLanguage);
    notifyListeners();
  }
}
