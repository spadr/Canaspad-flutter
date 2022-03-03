import 'package:freezed_annotation/freezed_annotation.dart';

part 'element_state.freezed.dart';

@freezed
class ElementState with _$ElementState {
  const factory ElementState({
    @Default({}) Map<String, dynamic> res,
  }) = _ElementState;
}
