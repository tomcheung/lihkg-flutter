// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSettingDataImpl _$$UserSettingDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSettingDataImpl(
      contentFontSize: json['content_font_size'] as int? ?? 14,
      selectableContent: json['selectable_content'] as bool? ?? false,
      appThemeName: json['app_theme_name'] as String? ?? 'light',
    );

Map<String, dynamic> _$$UserSettingDataImplToJson(
        _$UserSettingDataImpl instance) =>
    <String, dynamic>{
      'content_font_size': instance.contentFontSize,
      'selectable_content': instance.selectableContent,
      'app_theme_name': instance.appThemeName,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userSettingHash() => r'983c2812ffadfc6d2fab629782162819b34fa3a2';

/// See also [UserSetting].
@ProviderFor(UserSetting)
final userSettingProvider =
    NotifierProvider<UserSetting, UserSettingData>.internal(
  UserSetting.new,
  name: r'userSettingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserSetting = Notifier<UserSettingData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
