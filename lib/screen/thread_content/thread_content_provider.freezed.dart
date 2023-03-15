// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_content_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ThreadContentState {
  List<ThreadItem> get items => throw _privateConstructorUsedError;
  ThreadCategoryItem get categoryItem => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;
  bool get ended => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThreadContentStateCopyWith<ThreadContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadContentStateCopyWith<$Res> {
  factory $ThreadContentStateCopyWith(
          ThreadContentState value, $Res Function(ThreadContentState) then) =
      _$ThreadContentStateCopyWithImpl<$Res, ThreadContentState>;
  @useResult
  $Res call(
      {List<ThreadItem> items,
      ThreadCategoryItem categoryItem,
      int lastPage,
      bool ended});
}

/// @nodoc
class _$ThreadContentStateCopyWithImpl<$Res, $Val extends ThreadContentState>
    implements $ThreadContentStateCopyWith<$Res> {
  _$ThreadContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? categoryItem = null,
    Object? lastPage = null,
    Object? ended = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ThreadItem>,
      categoryItem: null == categoryItem
          ? _value.categoryItem
          : categoryItem // ignore: cast_nullable_to_non_nullable
              as ThreadCategoryItem,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      ended: null == ended
          ? _value.ended
          : ended // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ThreadContentStateCopyWith<$Res>
    implements $ThreadContentStateCopyWith<$Res> {
  factory _$$_ThreadContentStateCopyWith(_$_ThreadContentState value,
          $Res Function(_$_ThreadContentState) then) =
      __$$_ThreadContentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ThreadItem> items,
      ThreadCategoryItem categoryItem,
      int lastPage,
      bool ended});
}

/// @nodoc
class __$$_ThreadContentStateCopyWithImpl<$Res>
    extends _$ThreadContentStateCopyWithImpl<$Res, _$_ThreadContentState>
    implements _$$_ThreadContentStateCopyWith<$Res> {
  __$$_ThreadContentStateCopyWithImpl(
      _$_ThreadContentState _value, $Res Function(_$_ThreadContentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? categoryItem = null,
    Object? lastPage = null,
    Object? ended = null,
  }) {
    return _then(_$_ThreadContentState(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ThreadItem>,
      categoryItem: null == categoryItem
          ? _value.categoryItem
          : categoryItem // ignore: cast_nullable_to_non_nullable
              as ThreadCategoryItem,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      ended: null == ended
          ? _value.ended
          : ended // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ThreadContentState implements _ThreadContentState {
  _$_ThreadContentState(
      {required final List<ThreadItem> items,
      required this.categoryItem,
      required this.lastPage,
      required this.ended})
      : _items = items;

  final List<ThreadItem> _items;
  @override
  List<ThreadItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final ThreadCategoryItem categoryItem;
  @override
  final int lastPage;
  @override
  final bool ended;

  @override
  String toString() {
    return 'ThreadContentState(items: $items, categoryItem: $categoryItem, lastPage: $lastPage, ended: $ended)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThreadContentState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.categoryItem, categoryItem) ||
                other.categoryItem == categoryItem) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.ended, ended) || other.ended == ended));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      categoryItem,
      lastPage,
      ended);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThreadContentStateCopyWith<_$_ThreadContentState> get copyWith =>
      __$$_ThreadContentStateCopyWithImpl<_$_ThreadContentState>(
          this, _$identity);
}

abstract class _ThreadContentState implements ThreadContentState {
  factory _ThreadContentState(
      {required final List<ThreadItem> items,
      required final ThreadCategoryItem categoryItem,
      required final int lastPage,
      required final bool ended}) = _$_ThreadContentState;

  @override
  List<ThreadItem> get items;
  @override
  ThreadCategoryItem get categoryItem;
  @override
  int get lastPage;
  @override
  bool get ended;
  @override
  @JsonKey(ignore: true)
  _$$_ThreadContentStateCopyWith<_$_ThreadContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
