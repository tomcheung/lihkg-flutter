import 'dart:developer' as developer;
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_theme.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';


@freezed
sealed class UserSettingData with _$UserSettingData {
  factory UserSettingData({
    @Default(14) int contentFontSize,
    @Default(false) bool selectableContent,
    @Default('light') String appThemeName,
  }) = _UserSettingData;

  factory UserSettingData.fromJson(Map<String, dynamic> json) =>
      _$UserSettingDataFromJson(json);
}


@Riverpod(keepAlive: true)
class UserSetting extends _$UserSetting {
  static const sharedPreferencesKey = 'user_preference';

  @override
  UserSettingData build() {
    return UserSettingData();
  }

  updateFontSize(int fontSize) {
    state = state.copyWith(contentFontSize: fontSize);
    savedSetting();
  }

  void setTheme(AppThemeData appTheme) {
    state = state.copyWith(appThemeName: appTheme.name);
    savedSetting();
  }

  void toggleTheme() {
    if (state.appThemeName == AppThemeData.light.name) {
      setTheme(AppThemeData.dark);
    } else {
      setTheme(AppThemeData.light);
    }
  }

  Future<UserSettingData> loadSavedSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final userSettingString = prefs.getString(sharedPreferencesKey);

    if (userSettingString == null) {
      developer.log('Cannot find user setting');
      return UserSettingData();
    }

    final json = jsonDecode(userSettingString);
    state = UserSettingData.fromJson(json);
    return state;
  }

  savedSetting() async {
    final prefs = await SharedPreferences.getInstance();

    String jsonString = jsonEncode(state.toJson());
    prefs.setString(sharedPreferencesKey, jsonString);
  }
}
