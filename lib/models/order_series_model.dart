import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class OrdersSeries {
  final int day;
  final int orders;
  final charts.Color barColor;

  OrdersSeries({
    required this.day,
    required this.orders,
    required this.barColor,
  });

  static final List<OrdersSeries> data = [
    OrdersSeries(
      day: 0,
      orders: 10,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 1,
      orders: 12,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 2,
      orders: 15,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 3,
      orders: 12,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 4,
      orders: 9,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 5,
      orders: 19,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 6,
      orders: 16,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 7,
      orders: 19,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 8,
      orders: 21,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 9,
      orders: 19,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 10,
      orders: 27,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 11,
      orders: 30,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 12,
      orders: 19,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 13,
      orders: 25,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    OrdersSeries(
      day: 14,
      orders: 29,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
  ];
}
