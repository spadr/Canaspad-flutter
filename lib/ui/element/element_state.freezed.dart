// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'element_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ElementStateTearOff {
  const _$ElementStateTearOff();

  _ElementState call({Map<String, dynamic> res = const {}}) {
    return _ElementState(
      res: res,
    );
  }
}

/// @nodoc
const $ElementState = _$ElementStateTearOff();

/// @nodoc
mixin _$ElementState {
  Map<String, dynamic> get res => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ElementStateCopyWith<ElementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElementStateCopyWith<$Res> {
  factory $ElementStateCopyWith(
          ElementState value, $Res Function(ElementState) then) =
      _$ElementStateCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> res});
}

/// @nodoc
class _$ElementStateCopyWithImpl<$Res> implements $ElementStateCopyWith<$Res> {
  _$ElementStateCopyWithImpl(this._value, this._then);

  final ElementState _value;
  // ignore: unused_field
  final $Res Function(ElementState) _then;

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
abstract class _$ElementStateCopyWith<$Res>
    implements $ElementStateCopyWith<$Res> {
  factory _$ElementStateCopyWith(
          _ElementState value, $Res Function(_ElementState) then) =
      __$ElementStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, dynamic> res});
}

/// @nodoc
class __$ElementStateCopyWithImpl<$Res> extends _$ElementStateCopyWithImpl<$Res>
    implements _$ElementStateCopyWith<$Res> {
  __$ElementStateCopyWithImpl(
      _ElementState _value, $Res Function(_ElementState) _then)
      : super(_value, (v) => _then(v as _ElementState));

  @override
  _ElementState get _value => super._value as _ElementState;

  @override
  $Res call({
    Object? res = freezed,
  }) {
    return _then(_ElementState(
      res: res == freezed
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_ElementState implements _ElementState {
  const _$_ElementState({this.res = const {}});

  @JsonKey()
  @override
  final Map<String, dynamic> res;

  @override
  String toString() {
    return 'ElementState(res: $res)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ElementState &&
            const DeepCollectionEquality().equals(other.res, res));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(res));

  @JsonKey(ignore: true)
  @override
  _$ElementStateCopyWith<_ElementState> get copyWith =>
      __$ElementStateCopyWithImpl<_ElementState>(this, _$identity);
}

abstract class _ElementState implements ElementState {
  const factory _ElementState({Map<String, dynamic> res}) = _$_ElementState;

  @override
  Map<String, dynamic> get res;
  @override
  @JsonKey(ignore: true)
  _$ElementStateCopyWith<_ElementState> get copyWith =>
      throw _privateConstructorUsedError;
}
