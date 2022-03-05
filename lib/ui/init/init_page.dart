//import 'package:canaspad/gen/assets.gen.dart';
//import 'package:canaspad/ui/hooks/use_l10n.dart';
//import 'package:canaspad/ui/theme/app_text_theme.dart';
import 'package:canaspad/ui/theme/app_theme.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'init_view_model.dart';

class LinearElement {
  final DateTime time;
  final double value;

  LinearElement(this.time, this.value);
}

class InitPage extends HookConsumerWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(initViewModelProvider);
    //final viewModel = ref.watch(initViewModelProvider.notifier);
    //final l10n = useL10n();

    return state.when(
      data: (data) {
        final item = _createChart(data.res);
        final itemCount = item.length;
        return Scaffold(
          body: SafeArea(
            child: Center(
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
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.contacts),
                label: 'Latest',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Sensing',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Control',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            type: BottomNavigationBarType.fixed,
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

  List<Widget> _createChart(Map<String, dynamic> input) {
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
                _createElement(channelsTubes[chNumber]),
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

  List<charts.Series<LinearElement, DateTime>> _createElement(
      List<Map<String, dynamic>> inputs) {
    List<charts.Series<LinearElement, DateTime>> plot = [];
    for (var input in inputs) {
      //debugPrint('tube:' + input.toString());
      var data = _parseElement(input['elements']);
      plot.add(charts.Series<LinearElement, DateTime>(
        id: input['name'],
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (linearElement, _) => linearElement.time,
        measureFn: (linearElement, _) => linearElement.value,
        data: data,
      ));
    }
    return plot;
  }

  List<LinearElement> _parseElement(List<dynamic> input) {
    //debugPrint(input.toString());
    List<LinearElement> parsed = [];
    for (var element in input) {
      if (element.isNotEmpty) {
        parsed.add(
            LinearElement(DateTime.parse(element['time']), element['value']));
      }
    }
    return parsed;
  }
}
