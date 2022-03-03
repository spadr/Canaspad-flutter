import 'package:canaspad/data/repository/element/element_repository.dart';
import 'package:canaspad/data/repository/element/element_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'element_state.dart';

final elementViewModelProvider = StateNotifierProvider.autoDispose<
    ElementViewModel, AsyncValue<ElementState>>(
  (ref) => ElementViewModel(ref: ref),
);

class ElementViewModel extends StateNotifier<AsyncValue<ElementState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  ElementViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  // elementRepository
  late final ElementRepository elementRepository =
      _ref.read(elementRepositoryProvider);

  // GET
  Future<void> load() async {
    final result =
        await elementRepository.elementGet(accessToken: 'String accessToken');
    result.when(
      success: (data) {
        state = AsyncValue.data(
          ElementState(res: data),
        );
      },
      failure: (error) {
        debugPrint('ERR');
        state = AsyncValue.error(error);
      },
    );
  }
}
