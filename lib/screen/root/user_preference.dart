import 'package:lihkg_flutter/core/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  AppThemeData get appTheme => _appTheme;
  AppThemeData _appTheme;

  set appTheme(AppThemeData appTheme) {
    _appTheme = appTheme;
    _saveStringPref(ThemeNameKey, appTheme.name);
  }

  static const ThemeNameKey = "themeName";

  UserPreference({required AppThemeData appTheme}):
        _appTheme = appTheme;

  static Future<UserPreference> loadFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    AppThemeData appTheme;

    switch (prefs.getString(ThemeNameKey)) {
      case 'light':
        appTheme = AppThemeData.light;
        break;

      case 'dark':
        appTheme = AppThemeData.dark;
        break;

      default:
        appTheme = AppThemeData.light;
        break;

    }
    return UserPreference(appTheme: appTheme);
  }

  void _saveStringPref(String key, String value) {
    SharedPreferences.getInstance().then((pref) => pref.setString(key, value));
  }

}