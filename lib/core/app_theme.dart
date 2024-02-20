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

  static ThemeData createTheme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 18, color: scheme.onSurface),
      ),
      textTheme: TextTheme(
        titleSmall: TextStyle(fontSize: 11, color: scheme.onSurfaceVariant.withOpacity(0.7)),
        bodyMedium: TextStyle(fontSize: 16, color: scheme.onSurface),
      )
    );
  }

  static final AppThemeData light = AppThemeData(
    name: 'light',
    materialThemeData: createTheme(
      ColorScheme.fromSeed(
        seedColor: const Color(0xfffbc627),
      ),
    ),
  );

  static final AppThemeData dark = AppThemeData(
    name: 'dark',
    materialThemeData: createTheme(
      ColorScheme.fromSeed(
        seedColor: const Color(0xff94791e),
        brightness: Brightness.dark
      ),
    ),
  );
}

@riverpod
AppThemeData appTheme(AppThemeRef ref) {
  final themeName = ref
      .watch(userSettingProvider.select((settings) => settings.appThemeName));
  return [AppThemeData.light, AppThemeData.dark]
      .firstWhere((t) => t.name == themeName, orElse: () => AppThemeData.light);
}
