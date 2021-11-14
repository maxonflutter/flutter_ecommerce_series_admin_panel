import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flutter_ecommerce_backend/models/models.dart';

class Order extends Equatable {
  final int id;
  final int customerId;
  final List<int> productIds;
  final double deliveryFee;
  final double subtotal;
  final double total;
  final DateTime createdAt;

  const Order({
    required this.id,
    required this.customerId,
    required this.productIds,
    required this.deliveryFee,
    required this.subtotal,
    required this.total,
    required this.createdAt,
  });

  Order copyWith({
    int? id,
    int? customerId,
    List<int>? productIds,
    double? deliveryFee,
    double? subtotal,
    double? total,
    DateTime? createdAt,
  }) {
    return Order(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      productIds: productIds ?? this.productIds,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerId': customerId,
      'productIds': productIds,
      'deliveryFee': deliveryFee,
      'subtotal': subtotal,
      'total': total,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      customerId: map['customerId'],
      productIds: map['productIds'],
      deliveryFee: map['deliveryFee'],
      subtotal: map['subtotal'],
      total: map['total'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      customerId,
      productIds,
      deliveryFee,
      subtotal,
      total,
      createdAt,
    ];
  }

  static List<Order> orders = [
    Order(
      id: 1,
      customerId: 2345,
      productIds: const [1, 2],
      deliveryFee: 10,
      subtotal: 20,
      total: 30,
      createdAt: DateTime.now(),
    ),
    Order(
      id: 2,
      customerId: 2345,
      productIds: const [1, 2],
      deliveryFee: 10,
      subtotal: 20,
      total: 30,
      createdAt: DateTime.now(),
    ),
    Order(
      id: 3,
      customerId: 2345,
      productIds: const [1, 2],
      deliveryFee: 10,
      subtotal: 20,
      total: 30,
      createdAt: DateTime.now(),
    ),
  ];
}
