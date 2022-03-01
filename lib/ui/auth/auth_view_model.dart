import 'package:canaspad/data/repository/auth/auth_repository.dart';
import 'package:canaspad/data/repository/auth/auth_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth_state.dart';

final authViewModelProvider =
    StateNotifierProvider.autoDispose<AuthViewModel, AsyncValue<AuthState>>(
  (ref) => AuthViewModel(ref: ref),
);

class AuthViewModel extends StateNotifier<AsyncValue<AuthState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  AuthViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  // authRepository
  late final AuthRepository authRepository = _ref.read(authRepositoryProvider);

  // access&refreshToken取得
  Future<void> load() async {
    final result = await authRepository.access(
        id: const String.fromEnvironment('CANASPAD_ID'),
        pass: const String.fromEnvironment('CANASPAD_PASS'));
    result.when(
      success: (data) {
        state = AsyncValue.data(
          AuthState(token: data),
        );
      },
      failure: (error) {
        debugPrint('ERR');
        state = AsyncValue.error(error);
      },
    );
  }

  // accessToken取得
  Future<void> revoke() async {
    final token = state.value!.token;
    final result = await authRepository.refresh(refreshToken: token['refresh']);
    result.when(
      success: (data) {
        token['access'] = data['access'];
        state = AsyncValue.data(
          AuthState(token: token),
        );
      },
      failure: (error) {
        debugPrint('ERR');
        //state = AsyncValue.error(error);
        load();
      },
    );
  }
}
