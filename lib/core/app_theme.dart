import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lihkg_flutter/core/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
        segmentedButtonTheme: SegmentedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade100)),
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
          elevation: 2,
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
        segmentedButtonTheme: SegmentedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade400)),
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
          elevation: 2,
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

@riverpod
AppThemeData appTheme(AppThemeRef ref) {
  final themeName = ref.watch(userSettingProvider.select((settings) => settings.appThemeName));
  return [AppThemeData.light, AppThemeData.dark]
      .firstWhere((t) => t.name == themeName, orElse: () => AppThemeData.light);
}