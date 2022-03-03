import 'package:canaspad/data/repository/tube/tube_repository.dart';
import 'package:canaspad/data/repository/tube/tube_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'tube_state.dart';

final tubeViewModelProvider =
    StateNotifierProvider.autoDispose<TubeViewModel, AsyncValue<TubeState>>(
  (ref) => TubeViewModel(ref: ref),
);

class TubeViewModel extends StateNotifier<AsyncValue<TubeState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  TubeViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  // tubeRepository
  late final TubeRepository tubeRepository = _ref.read(tubeRepositoryProvider);

  // Get
  Future<void> load() async {
    final result =
        await tubeRepository.tubeGet(accessToken: 'String accessToken');
    result.when(
      success: (data) {
        state = AsyncValue.data(
          TubeState(res: data),
        );
      },
      failure: (error) {
        debugPrint('ERR');
        state = AsyncValue.error(error);
      },
    );
  }
}
