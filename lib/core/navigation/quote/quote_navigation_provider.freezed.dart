// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_navigation_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuoteNavigationStateData {
  List<ThreadContentItemData> get quoteStack =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuoteNavigationStateDataCopyWith<QuoteNavigationStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteNavigationStateDataCopyWith<$Res> {
  factory $QuoteNavigationStateDataCopyWith(QuoteNavigationStateData value,
          $Res Function(QuoteNavigationStateData) then) =
      _$QuoteNavigationStateDataCopyWithImpl<$Res, QuoteNavigationStateData>;
  @useResult
  $Res call({List<ThreadContentItemData> quoteStack});
}

/// @nodoc
class _$QuoteNavigationStateDataCopyWithImpl<$Res,
        $Val extends QuoteNavigationStateData>
    implements $QuoteNavigationStateDataCopyWith<$Res> {
  _$QuoteNavigationStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quoteStack = null,
  }) {
    return _then(_value.copyWith(
      quoteStack: null == quoteStack
          ? _value.quoteStack
          : quoteStack // ignore: cast_nullable_to_non_nullable
              as List<ThreadContentItemData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuoteNavigationStateDataImplCopyWith<$Res>
    implements $QuoteNavigationStateDataCopyWith<$Res> {
  factory _$$QuoteNavigationStateDataImplCopyWith(
          _$QuoteNavigationStateDataImpl value,
          $Res Function(_$QuoteNavigationStateDataImpl) then) =
      __$$QuoteNavigationStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ThreadContentItemData> quoteStack});
}

/// @nodoc
class __$$QuoteNavigationStateDataImplCopyWithImpl<$Res>
    extends _$QuoteNavigationStateDataCopyWithImpl<$Res,
        _$QuoteNavigationStateDataImpl>
    implements _$$QuoteNavigationStateDataImplCopyWith<$Res> {
  __$$QuoteNavigationStateDataImplCopyWithImpl(
      _$QuoteNavigationStateDataImpl _value,
      $Res Function(_$QuoteNavigationStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quoteStack = null,
  }) {
    return _then(_$QuoteNavigationStateDataImpl(
      quoteStack: null == quoteStack
          ? _value._quoteStack
          : quoteStack // ignore: cast_nullable_to_non_nullable
              as List<ThreadContentItemData>,
    ));
  }
}

/// @nodoc

class _$QuoteNavigationStateDataImpl implements _QuoteNavigationStateData {
  _$QuoteNavigationStateDataImpl(
      {final List<ThreadContentItemData> quoteStack = const []})
      : _quoteStack = quoteStack;

  final List<ThreadContentItemData> _quoteStack;
  @override
  @JsonKey()
  List<ThreadContentItemData> get quoteStack {
    if (_quoteStack is EqualUnmodifiableListView) return _quoteStack;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quoteStack);
  }

  @override
  String toString() {
    return 'QuoteNavigationStateData(quoteStack: $quoteStack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuoteNavigationStateDataImpl &&
            const DeepCollectionEquality()
                .equals(other._quoteStack, _quoteStack));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_quoteStack));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteNavigationStateDataImplCopyWith<_$QuoteNavigationStateDataImpl>
      get copyWith => __$$QuoteNavigationStateDataImplCopyWithImpl<
          _$QuoteNavigationStateDataImpl>(this, _$identity);
}

abstract class _QuoteNavigationStateData implements QuoteNavigationStateData {
  factory _QuoteNavigationStateData(
          {final List<ThreadContentItemData> quoteStack}) =
      _$QuoteNavigationStateDataImpl;

  @override
  List<ThreadContentItemData> get quoteStack;
  @override
  @JsonKey(ignore: true)
  _$$QuoteNavigationStateDataImplCopyWith<_$QuoteNavigationStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
