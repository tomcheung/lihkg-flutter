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
        colorScheme: ColorScheme.light(
          primary: Colors.amber,
        ),
        backgroundColor: Color(0xFFECEDED),
        cardColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        primaryIconTheme: IconThemeData(color: Colors.black),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.black)),
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
            textStyle: TextStyle(fontSize: 16),
          ),
        ),
      ));

  static final AppThemeData dark = AppThemeData(
      name: 'dark',
      materialThemeData: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.amber,
        ),
        primarySwatch: Colors.amber,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey.shade900,
        cardColor: Color(0x805C5C5C),
        iconTheme: IconThemeData(color: Colors.white54),
        primaryIconTheme: IconThemeData(color: Colors.white70),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white10,
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.amber)),
        dividerColor: Color(0x80898787),
        textTheme: TextTheme(
            subtitle2: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 11,
                fontWeight: FontWeight.w500),
            bodyText1: TextStyle(color: Colors.white10)),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(fontSize: 16),
          ),
        ),
      ));
}

class AppTheme extends InheritedWidget {
  final AppThemeData theme;
  final Function(AppThemeData themeData) _onThemeUpdated;

  const AppTheme({
    required this.theme,
    required Widget child,
    required Function(AppThemeData themeData) onThemeUpdated,
  })  : _onThemeUpdated = onThemeUpdated,
        super(child: child);

  void setTheme(AppThemeData appTheme) {
    _onThemeUpdated(appTheme);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (oldWidget is AppTheme) {
      return oldWidget.theme.name != this.theme.name;
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
