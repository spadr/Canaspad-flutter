import 'package:canaspad/data/repository/auth/auth_repository.dart';
import 'package:canaspad/data/repository/auth/auth_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
    idState = false;
    passState = false;
    accessTokenState = false;
    refreshTokenState = false;
    save();
    load();
  }

  bool idState = false;
  bool passState = false;
  bool accessTokenState = false;
  bool refreshTokenState = false;

  // authRepository
  late final AuthRepository authRepository = _ref.read(authRepositoryProvider);
  late final storage = const FlutterSecureStorage();

  Future<void> save() async {
    await storage.write(key: 'id', value: 'raspberry@email.com');
    await storage.write(key: 'pass', value: 'raspberry');
  }

  Future<void> loadStorage() async {
    String? id = await storage.read(key: 'id');
    String? pass = await storage.read(key: 'pass');
    String? accessToken = await storage.read(key: 'accessToken');
    String? refreshToken = await storage.read(key: 'refreshToken');
    if (id!.isNotEmpty) {
      idState = true;
    }
    if (pass!.isNotEmpty) {
      passState = true;
    }
    if (accessToken!.isNotEmpty) {
      accessTokenState = true;
    }
    if (refreshToken!.isNotEmpty) {
      refreshTokenState = true;
    }
    AsyncValue.data(AuthState(idState: idState));
    AsyncValue.data(AuthState(passState: passState));
    AsyncValue.data(AuthState(accessTokenState: accessTokenState));
    AsyncValue.data(AuthState(refreshTokenState: refreshTokenState));
  }

  // access&refreshToken取得
  Future<void> load() async {
    loadStorage();
    String? id = await storage.read(key: 'id');
    String? pass = await storage.read(key: 'pass');
    final result =
        await authRepository.access(id: id.toString(), pass: pass.toString());
    result.when(
      success: (data) async {
        await storage.write(key: 'refreshToken', value: data['refresh']);
        await storage.write(key: 'accessToken', value: data['access']);
        String? accessToken = await storage.read(key: 'accessToken');
        String? refreshToken = await storage.read(key: 'refreshToken');
        if (accessToken!.isNotEmpty) {
          accessTokenState = true;
        }
        if (refreshToken!.isNotEmpty) {
          refreshTokenState = true;
        }
        AsyncValue.data(AuthState(accessTokenState: accessTokenState));
        AsyncValue.data(AuthState(refreshTokenState: refreshTokenState));
      },
      failure: (error) {
        debugPrint('Could not get access&refreshToken');
        accessTokenState = false;
        refreshTokenState = false;
        AsyncValue.data(AuthState(accessTokenState: accessTokenState));
        AsyncValue.data(AuthState(refreshTokenState: refreshTokenState));
        AsyncValue.error(error);
      },
    );
  }

  // accessToken取得
  Future<void> revoke() async {
    String? refreshToken = await storage.read(key: 'refreshToken');
    final result =
        await authRepository.refresh(refreshToken: refreshToken.toString());
    result.when(
      success: (data) async {
        await storage.write(key: 'accessToken', value: data['access']);
        String? accessToken = await storage.read(key: 'accessToken');
        if (accessToken!.isNotEmpty) {
          accessTokenState = true;
        }
        AsyncValue.data(AuthState(accessTokenState: accessTokenState));
      },
      failure: (error) {
        debugPrint('Could not get accessToken');
        load();
      },
    );
  }
}
