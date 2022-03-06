//import 'package:canaspad/gen/assets.gen.dart';
//import 'package:canaspad/ui/hooks/use_l10n.dart';
//import 'package:canaspad/ui/theme/app_text_theme.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:canaspad/ui/auth/auth_view_model.dart';

import 'package:canaspad/ui/init/init_page.dart';
import 'package:canaspad/ui/init/init_page_control.dart';
import 'package:canaspad/ui/init/init_page_latest.dart';

import 'package:canaspad/ui/theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bottom_bar_item.dart';
import 'box.dart';
import 'init_view_model.dart';

class InitSettingPage extends HookConsumerWidget {
  const InitSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final initState = ref.watch(initViewModelProvider);
    //final authState = ref.watch(authViewModelProvider);
    final authModel = ref.watch(authViewModelProvider.notifier);
    final initModel = ref.watch(initViewModelProvider.notifier);
    //final l10n = useL10n();

    final _formKey = GlobalKey<FormState>();

    void _onTap(int index) {
      debugPrint(index.toString());
      switch (index) {
        case 0:
          context.router.root.pushWidget(const InitPage());
          break;
        case 1:
          context.router.root.pushWidget(const InitLatestPage());
          break;
        case 2:
          context.router.root.pushWidget(const InitControlPage());
          break;
        case 3:
          context.router.root.pushWidget(const InitSettingPage());
          break;
        default:
          context.router.root.pushWidget(const InitPage());
      }
    }

    return initState.when(
      data: (data) {
        return Scaffold(
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // メールアドレス入力
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'メールアドレス'),
                    onChanged: (value) async {
                      debugPrint(value.toString());
                    },
                  ),
                  // パスワード入力
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'パスワード'),
                    obscureText: true,
                    onChanged: (value) async {
                      debugPrint(value.toString());
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    // メッセージ表示
                    child: Text('infoText'),
                  ),
                  SizedBox(
                    width: double.infinity,
                    // ログインボタン
                    child: ElevatedButton(
                      child: const Text('ログイン'),
                      onPressed: () {
                        initModel.load();
                        context.router.root.pushWidget(const InitPage());
                        debugPrint('LOG IN');
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    // ユーザー登録ボタン
                    child: ElevatedButton(
                      child: const Text('ユーザー登録'),
                      onPressed: () {
                        debugPrint('SIGN UP');
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      error: (e, msg) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(
              e.toString(),
              style: theme.textTheme.h30,
            ),
          ),
        ),
      ),
      loading: () => Scaffold(
        body: SafeArea(
          child: Center(
            child: CircularProgressIndicator(
              color: theme.appColors.primary,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> createChart(Map<String, dynamic> input) {
    debugPrint('user:' + input.toString());
    List<Widget> widget = [];
    List<String> channels = [];
    for (var tube in input['tubes']) {
      channels.add(tube['channel']);
    }

    channels = channels.toSet().toList();

    List<List<Map<String, dynamic>>> channelsTubes = [];
    for (var chset in channels) {
      List<Map<String, dynamic>> channelsTube = [];
      for (var tube in input['tubes']) {
        if (tube['channel'] == chset) {
          channelsTube.add(tube);
        }
      }
      channelsTubes.add(channelsTube);
    }

    for (var chNumber in List.generate(channels.length, (i) => i)) {
      if (channelsTubes[chNumber].isNotEmpty) {
        debugPrint('channelsTube:' + channelsTubes[chNumber].toString());
        Widget _titleArea = Container(
            margin: EdgeInsets.all(16.0),
            child: createElement(channelsTubes[chNumber]));
        widget.add(_titleArea);
      }
    }
    return widget;
  }
}
