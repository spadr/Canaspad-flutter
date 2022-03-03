import 'package:canaspad/data/repository/init/init_repository.dart';
import 'package:canaspad/data/repository/init/init_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'init_state.dart';

final initViewModelProvider =
    StateNotifierProvider.autoDispose<InitViewModel, AsyncValue<InitState>>(
  (ref) => InitViewModel(ref: ref),
);

class InitViewModel extends StateNotifier<AsyncValue<InitState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  InitViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  // initRepository
  late final InitRepository initRepository = _ref.read(initRepositoryProvider);

  // Get
  Future<void> load() async {
    final result =
        await initRepository.initGet(accessToken: 'String accessToken');
    result.when(
      success: (data) {
        state = AsyncValue.data(
          InitState(res: data),
        );
      },
      failure: (error) {
        debugPrint('ERR');
        state = AsyncValue.error(error);
      },
    );
  }
}
