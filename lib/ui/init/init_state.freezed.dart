// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'init_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InitStateTearOff {
  const _$InitStateTearOff();

  _InitState call({Map<String, dynamic> res = const {}}) {
    return _InitState(
      res: res,
    );
  }
}

/// @nodoc
const $InitState = _$InitStateTearOff();

/// @nodoc
mixin _$InitState {
  Map<String, dynamic> get res => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitStateCopyWith<InitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitStateCopyWith<$Res> {
  factory $InitStateCopyWith(InitState value, $Res Function(InitState) then) =
      _$InitStateCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> res});
}

/// @nodoc
class _$InitStateCopyWithImpl<$Res> implements $InitStateCopyWith<$Res> {
  _$InitStateCopyWithImpl(this._value, this._then);

  final InitState _value;
  // ignore: unused_field
  final $Res Function(InitState) _then;

  @override
  $Res call({
    Object? res = freezed,
  }) {
    return _then(_value.copyWith(
      res: res == freezed
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$InitStateCopyWith<$Res> implements $InitStateCopyWith<$Res> {
  factory _$InitStateCopyWith(
          _InitState value, $Res Function(_InitState) then) =
      __$InitStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, dynamic> res});
}

/// @nodoc
class __$InitStateCopyWithImpl<$Res> extends _$InitStateCopyWithImpl<$Res>
    implements _$InitStateCopyWith<$Res> {
  __$InitStateCopyWithImpl(_InitState _value, $Res Function(_InitState) _then)
      : super(_value, (v) => _then(v as _InitState));

  @override
  _InitState get _value => super._value as _InitState;

  @override
  $Res call({
    Object? res = freezed,
  }) {
    return _then(_InitState(
      res: res == freezed
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_InitState implements _InitState {
  const _$_InitState({this.res = const {}});

  @JsonKey()
  @override
  final Map<String, dynamic> res;

  @override
  String toString() {
    return 'InitState(res: $res)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InitState &&
            const DeepCollectionEquality().equals(other.res, res));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(res));

  @JsonKey(ignore: true)
  @override
  _$InitStateCopyWith<_InitState> get copyWith =>
      __$InitStateCopyWithImpl<_InitState>(this, _$identity);
}

abstract class _InitState implements InitState {
  const factory _InitState({Map<String, dynamic> res}) = _$_InitState;

  @override
  Map<String, dynamic> get res;
  @override
  @JsonKey(ignore: true)
  _$InitStateCopyWith<_InitState> get copyWith =>
      throw _privateConstructorUsedError;
}
