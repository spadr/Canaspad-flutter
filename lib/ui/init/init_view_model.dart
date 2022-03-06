import 'dart:ffi';

import 'package:canaspad/data/repository/init/init_repository.dart';
import 'package:canaspad/data/repository/init/init_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  late final storage = const FlutterSecureStorage();

  // Get
  Future<void> load() async {
    String? accessToken = await storage.read(key: 'accessToken');
    final result =
        await initRepository.initGet(accessToken: accessToken.toString());
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

  void turnAliveMonitoring(bool value) {
    final data = state.value!.res;
    data['user']['alive_monitoring'] = value;
    AsyncValue.data(
      InitState(res: data),
    );
  }

  void turnSendMessageToEmail(bool value) {
    final data = state.value!.res;
    data['user']['send_message_to_email'] = value;
    AsyncValue.data(
      InitState(res: data),
    );
  }

  void turnSendMessageToLine(bool value) {
    final data = state.value!.res;
    data['user']['send_message_to_line'] = value;
    AsyncValue.data(
      InitState(res: data),
    );
  }

  void changeLineToken(String? lineToken) {
    final data = state.value!.res;
    data['user']['line_token'] = lineToken;
    AsyncValue.data(
      InitState(res: data),
    );
  }

  void turnSendMessageToSlack(bool value) {
    final data = state.value!.res;
    data['user']['send_message_to_slack'] = value;
    AsyncValue.data(
      InitState(res: data),
    );
  }

  void changeSlackChannel(String? slackChannel) {
    final data = state.value!.res;
    data['user']['slack_channel'] = slackChannel;
    AsyncValue.data(
      InitState(res: data),
    );
  }

  void changeSlackToken(String? slackToken) {
    final data = state.value!.res;
    data['user']['slack_token'] = slackToken;
    AsyncValue.data(
      InitState(res: data),
    );
  }

  Future<void> userPut() async {
    final user = state.value!.res['user'];
    String? accessToken = await storage.read(key: 'accessToken');
    String userinfo = '{';
    user.forEach((key, value) {
      userinfo += '"$key" : "$value" ,';
    });
    final pos = userinfo.length - 1;
    userinfo = userinfo.substring(0, pos);
    userinfo += '}';
    final result = await initRepository.userPut(
        accessToken: accessToken.toString(), body: userinfo);
    result.when(
      success: (data) {
        load();
      },
      failure: (error) {
        debugPrint('ERR');
        load();
      },
    );
  }
}
