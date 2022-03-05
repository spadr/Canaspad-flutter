//import 'package:canaspad/gen/assets.gen.dart';
//import 'package:canaspad/ui/hooks/use_l10n.dart';
//import 'package:canaspad/ui/theme/app_text_theme.dart';
//import 'package:canaspad/ui/theme/app_theme.dart';
import 'package:canaspad/ui/auth/auth_view_model.dart';
import 'package:canaspad/ui/init/init_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:auto_route/auto_route.dart';
import 'package:canaspad/ui/init/init_view_model.dart';
import 'signup_page.dart';

class AuthPage extends HookConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authModel = ref.watch(authViewModelProvider.notifier);
    final initModel = ref.watch(initViewModelProvider.notifier);

    //final theme = ref.watch(appThemeProvider);
    //final state = ref.watch(authViewModelProvider);
    //final viewModel = ref.watch(authViewModelProvider.notifier);
    //final l10n = useL10n();
    // メッセージ表示用
    String infoText = '';
    // 入力したメールアドレス・パスワード
    //String email = '';
    //String password = '';

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
                  await storage.write(key: 'id', value: value.toString());
                  debugPrint(value.toString());
                },
              ),
              // パスワード入力
              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (value) async {
                  await storage.write(key: 'pass', value: value.toString());
                  debugPrint(value.toString());
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                // メッセージ表示
                child: Text(infoText),
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
                    launchSignUpURL();
                    debugPrint('SIGN UP');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
