// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lihkg_navigation_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LihkgNavigationStateData {
  ThreadCategoryItem? get selectedCategoryItem =>
      throw _privateConstructorUsedError;
  List<MainNavigatorPage> get pages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LihkgNavigationStateDataCopyWith<LihkgNavigationStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LihkgNavigationStateDataCopyWith<$Res> {
  factory $LihkgNavigationStateDataCopyWith(LihkgNavigationStateData value,
          $Res Function(LihkgNavigationStateData) then) =
      _$LihkgNavigationStateDataCopyWithImpl<$Res, LihkgNavigationStateData>;
  @useResult
  $Res call(
      {ThreadCategoryItem? selectedCategoryItem,
      List<MainNavigatorPage> pages});
}

/// @nodoc
class _$LihkgNavigationStateDataCopyWithImpl<$Res,
        $Val extends LihkgNavigationStateData>
    implements $LihkgNavigationStateDataCopyWith<$Res> {
  _$LihkgNavigationStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategoryItem = freezed,
    Object? pages = null,
  }) {
    return _then(_value.copyWith(
      selectedCategoryItem: freezed == selectedCategoryItem
          ? _value.selectedCategoryItem
          : selectedCategoryItem // ignore: cast_nullable_to_non_nullable
              as ThreadCategoryItem?,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<MainNavigatorPage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LihkgNavigationStateDataCopyWith<$Res>
    implements $LihkgNavigationStateDataCopyWith<$Res> {
  factory _$$_LihkgNavigationStateDataCopyWith(
          _$_LihkgNavigationStateData value,
          $Res Function(_$_LihkgNavigationStateData) then) =
      __$$_LihkgNavigationStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ThreadCategoryItem? selectedCategoryItem,
      List<MainNavigatorPage> pages});
}

/// @nodoc
class __$$_LihkgNavigationStateDataCopyWithImpl<$Res>
    extends _$LihkgNavigationStateDataCopyWithImpl<$Res,
        _$_LihkgNavigationStateData>
    implements _$$_LihkgNavigationStateDataCopyWith<$Res> {
  __$$_LihkgNavigationStateDataCopyWithImpl(_$_LihkgNavigationStateData _value,
      $Res Function(_$_LihkgNavigationStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategoryItem = freezed,
    Object? pages = null,
  }) {
    return _then(_$_LihkgNavigationStateData(
      selectedCategoryItem: freezed == selectedCategoryItem
          ? _value.selectedCategoryItem
          : selectedCategoryItem // ignore: cast_nullable_to_non_nullable
              as ThreadCategoryItem?,
      pages: null == pages
          ? _value._pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<MainNavigatorPage>,
    ));
  }
}

/// @nodoc

class _$_LihkgNavigationStateData implements _LihkgNavigationStateData {
  _$_LihkgNavigationStateData(
      {this.selectedCategoryItem,
      final List<MainNavigatorPage> pages = const []})
      : _pages = pages;

  @override
  final ThreadCategoryItem? selectedCategoryItem;
  final List<MainNavigatorPage> _pages;
  @override
  @JsonKey()
  List<MainNavigatorPage> get pages {
    if (_pages is EqualUnmodifiableListView) return _pages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pages);
  }

  @override
  String toString() {
    return 'LihkgNavigationStateData(selectedCategoryItem: $selectedCategoryItem, pages: $pages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LihkgNavigationStateData &&
            (identical(other.selectedCategoryItem, selectedCategoryItem) ||
                other.selectedCategoryItem == selectedCategoryItem) &&
            const DeepCollectionEquality().equals(other._pages, _pages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedCategoryItem,
      const DeepCollectionEquality().hash(_pages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LihkgNavigationStateDataCopyWith<_$_LihkgNavigationStateData>
      get copyWith => __$$_LihkgNavigationStateDataCopyWithImpl<
          _$_LihkgNavigationStateData>(this, _$identity);
}

abstract class _LihkgNavigationStateData implements LihkgNavigationStateData {
  factory _LihkgNavigationStateData(
      {final ThreadCategoryItem? selectedCategoryItem,
      final List<MainNavigatorPage> pages}) = _$_LihkgNavigationStateData;

  @override
  ThreadCategoryItem? get selectedCategoryItem;
  @override
  List<MainNavigatorPage> get pages;
  @override
  @JsonKey(ignore: true)
  _$$_LihkgNavigationStateDataCopyWith<_$_LihkgNavigationStateData>
      get copyWith => throw _privateConstructorUsedError;
}
