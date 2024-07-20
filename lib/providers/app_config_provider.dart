import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  late SharedPreferences _prefs;

  // البيانات
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  AppConfigProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    // تحميل الإعدادات من SharedPreferences
    appLanguage = _prefs.getString('appLanguage') ?? 'en';
    String themeModeString = _prefs.getString('appTheme') ?? 'light';
    appTheme = themeModeString == 'dark' ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }

  Future<void> loadPreferences() async {
    await _loadPreferences();
  }

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    await _prefs.setString('appLanguage', newLanguage);
    notifyListeners();
  }

  Future<void> changeTheme(ThemeMode newMode) async {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    String themeModeString = newMode == ThemeMode.dark ? 'dark' : 'light';
    await _prefs.setString('appTheme', themeModeString);
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
}
