import 'package:flutter/material.dart';

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
        colorScheme: const ColorScheme.light(
          primary: Colors.amber,
        ),
        backgroundColor: const Color(0xFFECEDED),
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
        textTheme: TextTheme(
          subtitle2: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 11,
              fontWeight: FontWeight.w500),
        ),
        dividerColor: Colors.grey.shade200,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.black,
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ));

  static final AppThemeData dark = AppThemeData(
      name: 'dark',
      materialThemeData: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Colors.amber,
        ),
        primarySwatch: Colors.amber,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey.shade900,
        cardColor: const Color(0x805C5C5C),
        iconTheme: const IconThemeData(color: Colors.white54),
        primaryIconTheme: const IconThemeData(color: Colors.white70),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white10,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        dividerColor: const Color(0x80898787),
        textTheme: TextTheme(
            subtitle2: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 11,
                fontWeight: FontWeight.w500),
            bodyText1: const TextStyle(color: Colors.white10)),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ));
}

class AppTheme extends InheritedWidget {
  final AppThemeData theme;
  final Function(AppThemeData themeData) _onThemeUpdated;

  const AppTheme({
    Key? key,
    required this.theme,
    required Widget child,
    required Function(AppThemeData themeData) onThemeUpdated,
  })  : _onThemeUpdated = onThemeUpdated,
        super(child: child, key: key);

  void setTheme(AppThemeData appTheme) {
    _onThemeUpdated(appTheme);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (oldWidget is AppTheme) {
      return oldWidget.theme.name != theme.name;
    } else {
      return false;
    }
  }

  static updateTheme(AppThemeData theme, BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null, 'No AppTheme found in context');
    result?._onThemeUpdated(theme);
  }

  static AppThemeData of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null, 'No AppTheme found in context');
    return result!.theme;
  }
}
