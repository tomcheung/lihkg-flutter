import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme.g.dart';

class AppThemeData {
  final String name;
  final ThemeData materialThemeData;

  const AppThemeData({
    required this.name,
    required this.materialThemeData,
  });

  static final AppThemeData light = AppThemeData(
      name: 'light',
      materialThemeData: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Colors.amber,
          background: Color(0xFFECEDED),
        ),
        cardColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        primaryIconTheme: const IconThemeData(color: Colors.black),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        dividerColor: Colors.grey.shade200,
        textTheme: TextTheme(
          titleSmall: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 11,
              fontWeight: FontWeight.w500),
          bodyMedium: const TextStyle(color: Colors.black),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ));

  static final AppThemeData dark = AppThemeData(
      name: 'dark',
      materialThemeData: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
            primary: Colors.amber, background: Colors.black),
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.grey.shade900,
        cardColor: const Color(0x805C5C5C),
        iconTheme: const IconThemeData(color: Colors.white54),
        primaryIconTheme: const IconThemeData(color: Colors.white70),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white10,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        dividerColor: const Color(0x80898787),
        textTheme: TextTheme(
          titleSmall: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 11,
              fontWeight: FontWeight.w500),
          bodyMedium: const TextStyle(color: Colors.white),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ));
}

@Riverpod(keepAlive: true)
class AppTheme extends _$AppTheme {
  static const _themeNameKey = "themeName";

  @override
  AppThemeData build() {
    return AppThemeData.light;
  }

  Future<AppThemeData> fetchSavedTheme() async {
    final theme = await _getSaveTheme();
    state = theme;
    return theme;
  }

  void setTheme(AppThemeData appTheme) {
    _saveTheme(appTheme);
    state = appTheme;
  }

  void toggleTheme() {
    if (state.name == AppThemeData.light.name) {
      setTheme(AppThemeData.dark);
    } else {
      setTheme(AppThemeData.light);
    }
  }

  void _saveTheme(AppThemeData appTheme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_themeNameKey, appTheme.name);
  }

  Future<AppThemeData> _getSaveTheme() async {
    final prefs = await SharedPreferences.getInstance();

    switch (prefs.getString(_themeNameKey)) {
      case 'light':
        return AppThemeData.light;
      case 'dark':
        return AppThemeData.dark;
      default:
        return AppThemeData.light;
    }
  }
}
