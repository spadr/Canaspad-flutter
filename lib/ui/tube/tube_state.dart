import 'package:freezed_annotation/freezed_annotation.dart';

part 'tube_state.freezed.dart';

@freezed
class TubeState with _$TubeState {
  const factory TubeState({
    @Default({}) Map<String, dynamic> res,
  }) = _TubeState;
}
