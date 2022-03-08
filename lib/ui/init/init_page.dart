//import 'package:canaspad/gen/assets.gen.dart';
//import 'package:canaspad/ui/hooks/use_l10n.dart';
//import 'package:canaspad/ui/theme/app_text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:canaspad/ui/auth/auth_page.dart';
import 'package:canaspad/ui/auth/auth_view_model.dart';
import 'package:canaspad/ui/init/init_page_control.dart';
import 'package:canaspad/ui/init/init_page_latest.dart';
import 'package:canaspad/ui/init/init_page_setting.dart';
import 'package:canaspad/ui/theme/app_theme.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bottom_bar_item.dart';
import 'charts.dart';
import 'init_view_model.dart';

class InitPage extends HookConsumerWidget {
  const InitPage({Key? key}) : super(key: key);

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
            currentIndex: 0,
            onTap: _onTap,
          ),
        );
      },
      error: (e, msg) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Text(
                e.toString(),
                style: theme.textTheme.h30,
              ),
            ),
          ),
        );
      },
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
          //操作につかう変数は表示しない
          if (!tube['is_variable']) {
            channelsTube.add(tube);
          }
        }
      }
      channelsTubes.add(channelsTube);
    }

    for (var chNumber in List.generate(channels.length, (i) => i)) {
      if (channelsTubes[chNumber].isNotEmpty) {
        //debugPrint('channelsTube:' + channelsTubes[chNumber].toString());
        widget.add(SizedBox(
            height: 200,
            child: charts.TimeSeriesChart(
                createElement(channelsTubes[chNumber]),
                animate: true,
                animationDuration: const Duration(seconds: 1),
                behaviors: [
                  charts.SeriesLegend(
                    position: charts.BehaviorPosition.bottom,
                    desiredMaxColumns: 3,
                  ),
                  charts.ChartTitle(
                    channels[chNumber],
                    behaviorPosition: charts.BehaviorPosition.top, //横軸なので下に表示
                    titleOutsideJustification:
                        charts.OutsideJustification.middleDrawArea,
                  ),
                ],
                dateTimeFactory: const charts.LocalDateTimeFactory(),
                domainAxis: const charts.DateTimeAxisSpec(
                  tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                    day: charts.TimeFormatterSpec(
                      format: 'dd/MM',
                      transitionFormat: 'dd/MM',
                    ),
                    hour: charts.TimeFormatterSpec(
                        format: 'hh:mm', transitionFormat: 'hh:mm'),
                  ),
                ),
                primaryMeasureAxis: const charts.NumericAxisSpec(
                  //縦軸
                  tickProviderSpec: charts.BasicNumericTickProviderSpec(
                    zeroBound: false,
                    desiredMinTickCount: 3,
                    desiredMaxTickCount: 15,
                  ),
                ))));
      }
    }
    return widget;
  }
}
