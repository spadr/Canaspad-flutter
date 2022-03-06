//import 'package:canaspad/gen/assets.gen.dart';
//import 'package:canaspad/ui/hooks/use_l10n.dart';
//import 'package:canaspad/ui/theme/app_text_theme.dart';
//import 'package:canaspad/ui/theme/app_theme.dart';

import 'package:auto_route/auto_route.dart';
import 'package:canaspad/ui/auth/auth_view_model.dart';
import 'package:canaspad/ui/init/bottom_bar_item.dart';
import 'package:canaspad/ui/init/init_page.dart';
import 'package:canaspad/ui/init/init_page_control.dart';
import 'package:canaspad/ui/init/init_page_latest.dart';
import 'package:canaspad/ui/init/init_page_setting.dart';
import 'package:canaspad/ui/init/init_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'signup_page.dart';

class AuthPage extends HookConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authModel = ref.watch(authViewModelProvider.notifier);
    final initModel = ref.watch(initViewModelProvider.notifier);

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
              SizedBox(
                width: double.infinity,
                // ログインボタン
                child: ElevatedButton(
                  child: const Text('ログイン'),
                  onPressed: () async {
                    await authModel.load();
                    await initModel.load();
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
      bottomNavigationBar: BottomNavigationBar(
        items: barItem,
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
      ),
    );
  }
}
