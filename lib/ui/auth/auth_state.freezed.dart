// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthState call(
      {bool accessTokenState = false,
      bool refreshTokenState = false,
      bool passState = true,
      bool idState = true}) {
    return _AuthState(
      accessTokenState: accessTokenState,
      refreshTokenState: refreshTokenState,
      passState: passState,
      idState: idState,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  bool get accessTokenState => throw _privateConstructorUsedError;
  bool get refreshTokenState => throw _privateConstructorUsedError;
  bool get passState => throw _privateConstructorUsedError;
  bool get idState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {bool accessTokenState,
      bool refreshTokenState,
      bool passState,
      bool idState});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? accessTokenState = freezed,
    Object? refreshTokenState = freezed,
    Object? passState = freezed,
    Object? idState = freezed,
  }) {
    return _then(_value.copyWith(
      accessTokenState: accessTokenState == freezed
          ? _value.accessTokenState
          : accessTokenState // ignore: cast_nullable_to_non_nullable
              as bool,
      refreshTokenState: refreshTokenState == freezed
          ? _value.refreshTokenState
          : refreshTokenState // ignore: cast_nullable_to_non_nullable
              as bool,
      passState: passState == freezed
          ? _value.passState
          : passState // ignore: cast_nullable_to_non_nullable
              as bool,
      idState: idState == freezed
          ? _value.idState
          : idState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool accessTokenState,
      bool refreshTokenState,
      bool passState,
      bool idState});
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object? accessTokenState = freezed,
    Object? refreshTokenState = freezed,
    Object? passState = freezed,
    Object? idState = freezed,
  }) {
    return _then(_AuthState(
      accessTokenState: accessTokenState == freezed
          ? _value.accessTokenState
          : accessTokenState // ignore: cast_nullable_to_non_nullable
              as bool,
      refreshTokenState: refreshTokenState == freezed
          ? _value.refreshTokenState
          : refreshTokenState // ignore: cast_nullable_to_non_nullable
              as bool,
      passState: passState == freezed
          ? _value.passState
          : passState // ignore: cast_nullable_to_non_nullable
              as bool,
      idState: idState == freezed
          ? _value.idState
          : idState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {this.accessTokenState = false,
      this.refreshTokenState = false,
      this.passState = true,
      this.idState = true});

  @JsonKey()
  @override
  final bool accessTokenState;
  @JsonKey()
  @override
  final bool refreshTokenState;
  @JsonKey()
  @override
  final bool passState;
  @JsonKey()
  @override
  final bool idState;

  @override
  String toString() {
    return 'AuthState(accessTokenState: $accessTokenState, refreshTokenState: $refreshTokenState, passState: $passState, idState: $idState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthState &&
            const DeepCollectionEquality()
                .equals(other.accessTokenState, accessTokenState) &&
            const DeepCollectionEquality()
                .equals(other.refreshTokenState, refreshTokenState) &&
            const DeepCollectionEquality().equals(other.passState, passState) &&
            const DeepCollectionEquality().equals(other.idState, idState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accessTokenState),
      const DeepCollectionEquality().hash(refreshTokenState),
      const DeepCollectionEquality().hash(passState),
      const DeepCollectionEquality().hash(idState));

  @JsonKey(ignore: true)
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {bool accessTokenState,
      bool refreshTokenState,
      bool passState,
      bool idState}) = _$_AuthState;

  @override
  bool get accessTokenState;
  @override
  bool get refreshTokenState;
  @override
  bool get passState;
  @override
  bool get idState;
  @override
  @JsonKey(ignore: true)
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
