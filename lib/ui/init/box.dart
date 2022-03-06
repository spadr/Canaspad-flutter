import 'package:flutter/material.dart';

class LinearElement {
  final String time;
  final String value;
  final bool alive;

  LinearElement(this.time, this.value, this.alive);
}

Widget createElement(List<Map<String, dynamic>> inputs) {
  List<Widget> cols = [];
  String ch = "";
  var color = Colors.green;
  var icon = Icons.task_alt;
  for (var input in inputs) {
    ch = input['channel'];
    var name = input['name'];
    var data = parseElement(input['elements'], input['interval']);
    if (!data.alive) {
      color = Colors.red;
      icon = Icons.report_problem;
    }
    cols.add(Container(
      margin: EdgeInsets.only(bottom: 4.0),
      child: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    ));
    cols.add(Container(
      margin: EdgeInsets.only(bottom: 4.0),
      child: Text(
        data.value,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    ));
    cols.add(Container(
      margin: EdgeInsets.only(bottom: 4.0),
      child: Text(
        data.time,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    ));
  }
  var row = Row(
    // 1行目
    children: <Widget>[
      Icon(
        icon,
        color: color,
        size: 30,
      ),
      Text(
        ch,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      Text(
        "  ",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      Expanded(
        // 2.1列目
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: cols),
      ),
    ],
  );
  return row;
}

LinearElement parseElement(List<dynamic> input, int interval) {
  List<LinearElement> parsed = [];
  var element = input[0];
  if (element.isNotEmpty) {
    var value = element['value'];
    var time = DateTime.parse(element['time']);
    if (value is double) {
      parsed.add(LinearElement(fromAtNow(time), value.toStringAsPrecision(4),
          isAlive(time, interval)));
    } else if (value is bool) {
      if (value) {
        parsed
            .add(LinearElement(fromAtNow(time), "ON", isAlive(time, interval)));
      } else {
        parsed.add(
            LinearElement(fromAtNow(time), "OFF", isAlive(time, interval)));
      }
    } else {
      parsed.add(LinearElement(
          fromAtNow(time), value.toString(), isAlive(time, interval)));
    }
  }

  return parsed[0];
}

String fromAtNow(DateTime date) {
  final Duration difference = DateTime.now().toUtc().difference(date);
  final int sec = difference.inSeconds;

  if (sec >= 60 * 60 * 24) {
    return '${difference.inDays.toString()}日前';
  } else if (sec >= 60 * 60) {
    return '${difference.inHours.toString()}時間前';
  } else if (sec >= 60) {
    return '${difference.inMinutes.toString()}分前';
  } else {
    return '$sec秒前';
  }
}

bool isAlive(DateTime date, int interval) {
  final Duration difference = DateTime.now().difference(date);
  final int sec = difference.inSeconds;
  final int intervalSec = interval * 60;
  return intervalSec > sec;
}
