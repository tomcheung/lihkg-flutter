// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSettingData _$UserSettingDataFromJson(Map<String, dynamic> json) {
  return _UserSettingData.fromJson(json);
}

/// @nodoc
mixin _$UserSettingData {
  int get contentFontSize => throw _privateConstructorUsedError;
  bool get selectableContent => throw _privateConstructorUsedError;
  String get appThemeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingDataCopyWith<UserSettingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingDataCopyWith<$Res> {
  factory $UserSettingDataCopyWith(
          UserSettingData value, $Res Function(UserSettingData) then) =
      _$UserSettingDataCopyWithImpl<$Res, UserSettingData>;
  @useResult
  $Res call({int contentFontSize, bool selectableContent, String appThemeName});
}

/// @nodoc
class _$UserSettingDataCopyWithImpl<$Res, $Val extends UserSettingData>
    implements $UserSettingDataCopyWith<$Res> {
  _$UserSettingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentFontSize = null,
    Object? selectableContent = null,
    Object? appThemeName = null,
  }) {
    return _then(_value.copyWith(
      contentFontSize: null == contentFontSize
          ? _value.contentFontSize
          : contentFontSize // ignore: cast_nullable_to_non_nullable
              as int,
      selectableContent: null == selectableContent
          ? _value.selectableContent
          : selectableContent // ignore: cast_nullable_to_non_nullable
              as bool,
      appThemeName: null == appThemeName
          ? _value.appThemeName
          : appThemeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSettingDataImplCopyWith<$Res>
    implements $UserSettingDataCopyWith<$Res> {
  factory _$$UserSettingDataImplCopyWith(_$UserSettingDataImpl value,
          $Res Function(_$UserSettingDataImpl) then) =
      __$$UserSettingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int contentFontSize, bool selectableContent, String appThemeName});
}

/// @nodoc
class __$$UserSettingDataImplCopyWithImpl<$Res>
    extends _$UserSettingDataCopyWithImpl<$Res, _$UserSettingDataImpl>
    implements _$$UserSettingDataImplCopyWith<$Res> {
  __$$UserSettingDataImplCopyWithImpl(
      _$UserSettingDataImpl _value, $Res Function(_$UserSettingDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentFontSize = null,
    Object? selectableContent = null,
    Object? appThemeName = null,
  }) {
    return _then(_$UserSettingDataImpl(
      contentFontSize: null == contentFontSize
          ? _value.contentFontSize
          : contentFontSize // ignore: cast_nullable_to_non_nullable
              as int,
      selectableContent: null == selectableContent
          ? _value.selectableContent
          : selectableContent // ignore: cast_nullable_to_non_nullable
              as bool,
      appThemeName: null == appThemeName
          ? _value.appThemeName
          : appThemeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingDataImpl
    with DiagnosticableTreeMixin
    implements _UserSettingData {
  _$UserSettingDataImpl(
      {this.contentFontSize = 14,
      this.selectableContent = false,
      this.appThemeName = 'light'});

  factory _$UserSettingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingDataImplFromJson(json);

  @override
  @JsonKey()
  final int contentFontSize;
  @override
  @JsonKey()
  final bool selectableContent;
  @override
  @JsonKey()
  final String appThemeName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserSettingData(contentFontSize: $contentFontSize, selectableContent: $selectableContent, appThemeName: $appThemeName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserSettingData'))
      ..add(DiagnosticsProperty('contentFontSize', contentFontSize))
      ..add(DiagnosticsProperty('selectableContent', selectableContent))
      ..add(DiagnosticsProperty('appThemeName', appThemeName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingDataImpl &&
            (identical(other.contentFontSize, contentFontSize) ||
                other.contentFontSize == contentFontSize) &&
            (identical(other.selectableContent, selectableContent) ||
                other.selectableContent == selectableContent) &&
            (identical(other.appThemeName, appThemeName) ||
                other.appThemeName == appThemeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, contentFontSize, selectableContent, appThemeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingDataImplCopyWith<_$UserSettingDataImpl> get copyWith =>
      __$$UserSettingDataImplCopyWithImpl<_$UserSettingDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingDataImplToJson(
      this,
    );
  }
}

abstract class _UserSettingData implements UserSettingData {
  factory _UserSettingData(
      {final int contentFontSize,
      final bool selectableContent,
      final String appThemeName}) = _$UserSettingDataImpl;

  factory _UserSettingData.fromJson(Map<String, dynamic> json) =
      _$UserSettingDataImpl.fromJson;

  @override
  int get contentFontSize;
  @override
  bool get selectableContent;
  @override
  String get appThemeName;
  @override
  @JsonKey(ignore: true)
  _$$UserSettingDataImplCopyWith<_$UserSettingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
