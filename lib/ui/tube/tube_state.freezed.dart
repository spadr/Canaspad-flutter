// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tube_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TubeStateTearOff {
  const _$TubeStateTearOff();

  _TubeState call({Map<String, dynamic> res = const {}}) {
    return _TubeState(
      res: res,
    );
  }
}

/// @nodoc
const $TubeState = _$TubeStateTearOff();

/// @nodoc
mixin _$TubeState {
  Map<String, dynamic> get res => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TubeStateCopyWith<TubeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TubeStateCopyWith<$Res> {
  factory $TubeStateCopyWith(TubeState value, $Res Function(TubeState) then) =
      _$TubeStateCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> res});
}

/// @nodoc
class _$TubeStateCopyWithImpl<$Res> implements $TubeStateCopyWith<$Res> {
  _$TubeStateCopyWithImpl(this._value, this._then);

  final TubeState _value;
  // ignore: unused_field
  final $Res Function(TubeState) _then;

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
abstract class _$TubeStateCopyWith<$Res> implements $TubeStateCopyWith<$Res> {
  factory _$TubeStateCopyWith(
          _TubeState value, $Res Function(_TubeState) then) =
      __$TubeStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, dynamic> res});
}

/// @nodoc
class __$TubeStateCopyWithImpl<$Res> extends _$TubeStateCopyWithImpl<$Res>
    implements _$TubeStateCopyWith<$Res> {
  __$TubeStateCopyWithImpl(_TubeState _value, $Res Function(_TubeState) _then)
      : super(_value, (v) => _then(v as _TubeState));

  @override
  _TubeState get _value => super._value as _TubeState;

  @override
  $Res call({
    Object? res = freezed,
  }) {
    return _then(_TubeState(
      res: res == freezed
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_TubeState implements _TubeState {
  const _$_TubeState({this.res = const {}});

  @JsonKey()
  @override
  final Map<String, dynamic> res;

  @override
  String toString() {
    return 'TubeState(res: $res)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TubeState &&
            const DeepCollectionEquality().equals(other.res, res));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(res));

  @JsonKey(ignore: true)
  @override
  _$TubeStateCopyWith<_TubeState> get copyWith =>
      __$TubeStateCopyWithImpl<_TubeState>(this, _$identity);
}

abstract class _TubeState implements TubeState {
  const factory _TubeState({Map<String, dynamic> res}) = _$_TubeState;

  @override
  Map<String, dynamic> get res;
  @override
  @JsonKey(ignore: true)
  _$TubeStateCopyWith<_TubeState> get copyWith =>
      throw _privateConstructorUsedError;
}
