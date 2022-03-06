//import 'package:canaspad/gen/assets.gen.dart';
//import 'package:canaspad/ui/hooks/use_l10n.dart';
//import 'package:canaspad/ui/theme/app_text_theme.dart';
// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';

import 'package:canaspad/ui/auth/auth_view_model.dart';

import 'package:canaspad/ui/init/init_page.dart';
import 'package:canaspad/ui/init/init_page_control.dart';
import 'package:canaspad/ui/init/init_page_setting.dart';

import 'package:canaspad/ui/theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bottom_bar_item.dart';
import 'box.dart';
import 'init_view_model.dart';

class InitLatestPage extends HookConsumerWidget {
  const InitLatestPage({Key? key}) : super(key: key);

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
        final item = createChart(data.res);
        final itemCount = item.length;
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: RefreshIndicator(
                onRefresh: () async {
                  initModel.load();
                },
                child: ListView.separated(
                  itemCount: itemCount,
                  padding: const EdgeInsets.only(top: 20.0),
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.centerLeft,
                    child: item[index],
                  ),
                  separatorBuilder: (context, index) {
                    return const Divider(height: 0.5);
                  },
                ),
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
