import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderStats {
  final DateTime dateTime;
  final int index;
  final int orders;
  charts.Color? barColor;

  OrderStats({
    required this.dateTime,
    required this.index,
    required this.orders,
    this.barColor,
  }) {
    barColor = charts.ColorUtil.fromDartColor(Colors.black);
  }

  factory OrderStats.fromSnapshot(DocumentSnapshot snap, int index) {
    return OrderStats(
      index: index,
      dateTime: snap['dateTime'].toDate(),
      orders: snap['orders'],
    );
  }

  static final List<OrderStats> data = [
    OrderStats(
      dateTime: DateTime.now(),
      index: 0,
      orders: 10,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 1,
      orders: 12,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 2,
      orders: 15,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 3,
      orders: 12,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 4,
      orders: 9,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 5,
      orders: 19,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 6,
      orders: 16,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 7,
      orders: 19,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 8,
      orders: 21,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 9,
      orders: 19,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 10,
      orders: 27,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 11,
      orders: 30,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 12,
      orders: 19,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 13,
      orders: 25,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 14,
      orders: 29,
    ),
  ];
}
