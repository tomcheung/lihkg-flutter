// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ThreadListState {
  List<ThreadCategoryItem> get items => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThreadListStateCopyWith<ThreadListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadListStateCopyWith<$Res> {
  factory $ThreadListStateCopyWith(
          ThreadListState value, $Res Function(ThreadListState) then) =
      _$ThreadListStateCopyWithImpl<$Res, ThreadListState>;
  @useResult
  $Res call({List<ThreadCategoryItem> items, String categoryId, int lastPage});
}

/// @nodoc
class _$ThreadListStateCopyWithImpl<$Res, $Val extends ThreadListState>
    implements $ThreadListStateCopyWith<$Res> {
  _$ThreadListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? categoryId = null,
    Object? lastPage = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ThreadCategoryItem>,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ThreadListStateCopyWith<$Res>
    implements $ThreadListStateCopyWith<$Res> {
  factory _$$_ThreadListStateCopyWith(
          _$_ThreadListState value, $Res Function(_$_ThreadListState) then) =
      __$$_ThreadListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ThreadCategoryItem> items, String categoryId, int lastPage});
}

/// @nodoc
class __$$_ThreadListStateCopyWithImpl<$Res>
    extends _$ThreadListStateCopyWithImpl<$Res, _$_ThreadListState>
    implements _$$_ThreadListStateCopyWith<$Res> {
  __$$_ThreadListStateCopyWithImpl(
      _$_ThreadListState _value, $Res Function(_$_ThreadListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? categoryId = null,
    Object? lastPage = null,
  }) {
    return _then(_$_ThreadListState(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ThreadCategoryItem>,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ThreadListState implements _ThreadListState {
  _$_ThreadListState(
      {required final List<ThreadCategoryItem> items,
      required this.categoryId,
      required this.lastPage})
      : _items = items;

  final List<ThreadCategoryItem> _items;
  @override
  List<ThreadCategoryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String categoryId;
  @override
  final int lastPage;

  @override
  String toString() {
    return 'ThreadListState(items: $items, categoryId: $categoryId, lastPage: $lastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThreadListState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), categoryId, lastPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThreadListStateCopyWith<_$_ThreadListState> get copyWith =>
      __$$_ThreadListStateCopyWithImpl<_$_ThreadListState>(this, _$identity);
}

abstract class _ThreadListState implements ThreadListState {
  factory _ThreadListState(
      {required final List<ThreadCategoryItem> items,
      required final String categoryId,
      required final int lastPage}) = _$_ThreadListState;

  @override
  List<ThreadCategoryItem> get items;
  @override
  String get categoryId;
  @override
  int get lastPage;
  @override
  @JsonKey(ignore: true)
  _$$_ThreadListStateCopyWith<_$_ThreadListState> get copyWith =>
      throw _privateConstructorUsedError;
}
