import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool accessTokenState,
    @Default(false) bool refreshTokenState,
    @Default(true) bool passState,
    @Default(true) bool idState,
  }) = _AuthState;
}
