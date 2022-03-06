//import 'package:canaspad/gen/assets.gen.dart';
//import 'package:canaspad/ui/hooks/use_l10n.dart';
//import 'package:canaspad/ui/theme/app_text_theme.dart';

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
                  SwitchListTile(
                    value: data.res['user']['alive_monitoring'],
                    title: Text(
                      '死活監視機能',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (value) {
                      initModel.turnAliveMonitoring(value);
                      context.router.root.pushWidget(const InitSettingPage());
                    },
                  ),
                  SwitchListTile(
                    value: data.res['user']['send_message_to_email'],
                    title: Text(
                      '死活監視結果をEmailへ通知',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (value) {
                      initModel.turnSendMessageToEmail(value);
                      context.router.root.pushWidget(const InitSettingPage());
                    },
                  ),
                  SwitchListTile(
                    value: data.res['user']['send_message_to_line'],
                    title: Text(
                      '死活監視結果をLINEへ通知',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (value) {
                      initModel.turnSendMessageToLine(value);
                      context.router.root.pushWidget(const InitSettingPage());
                    },
                  ),
                  SwitchListTile(
                    value: data.res['user']['send_message_to_slack'],
                    title: Text(
                      '死活監視結果をSlackへ通知',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (value) {
                      initModel.turnSendMessageToSlack(value);
                      context.router.root.pushWidget(const InitSettingPage());
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'LINEトークン'),
                    initialValue: data.res['user']['line_token'],
                    onChanged: (value) async {
                      initModel.changeLineToken(value);
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Slackチャンネル'),
                    initialValue: data.res['user']['slack_channel'],
                    onChanged: (value) async {
                      initModel.changeSlackChannel(value);
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Slackトークン'),
                    initialValue: data.res['user']['slack_token'],
                    onChanged: (value) async {
                      initModel.changeSlackToken(value);
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('送信'),
                      onPressed: () async {
                        initModel.load();
                        initModel.userPut();
                        context.router.root.pushWidget(const InitPage());
                      },
                    ),
                  ),
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
        Widget _titleArea = Container(
            margin: EdgeInsets.all(16.0),
            child: createElement(channelsTubes[chNumber]));
        widget.add(_titleArea);
      }
    }
    return widget;
  }
}
