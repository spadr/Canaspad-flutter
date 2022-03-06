import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class LinearElement {
  final DateTime time;
  final double value;

  LinearElement(this.time, this.value);
}

List<charts.Series<LinearElement, DateTime>> createElement(
    List<Map<String, dynamic>> inputs) {
  List<charts.Series<LinearElement, DateTime>> plot = [];
  for (var input in inputs) {
    //debugPrint('tube:' + input.toString());
    var data = parseElement(input['elements']);
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

List<LinearElement> parseElement(List<dynamic> input) {
  //debugPrint(input.toString());
  List<LinearElement> parsed = [];
  for (var element in input) {
    if (element.isNotEmpty) {
      var value = element['value'];
      if (value is double) {
        parsed.add(LinearElement(DateTime.parse(element['time']), value));
      } else if (value is bool) {
        if (value) {
          parsed.add(LinearElement(DateTime.parse(element['time']), 1.0));
        } else {
          parsed.add(LinearElement(DateTime.parse(element['time']), 0.0));
        }
      } else {}
    }
  }
  return parsed;
}
