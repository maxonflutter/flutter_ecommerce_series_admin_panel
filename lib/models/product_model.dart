import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  double price;
  int quantity;

  Product({
    this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    this.price = 0,
    this.quantity = 0,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      category,
      description,
      imageUrl,
      isRecommended,
      isPopular,
      price,
      quantity,
    ];
  }

  Product copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isRecommended: isRecommended ?? this.isRecommended,
      isPopular: isPopular ?? this.isPopular,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
      id: snap.id,
      name: snap['name'],
      description: snap['description'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
      price: snap['price'],
      quantity: snap['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  static List<Product> products = [
    Product(
      id: '1',
      name: 'Soft Drink #1',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
      price: 4.99,
      quantity: 10,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '2',
      name: 'Soft Drink #2',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
      price: 2.99,
      quantity: 10,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: '3',
      name: 'Soft Drink #3',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1603833797131-3c0a18fcb6b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/5LIInaqRp5s
      price: 2.99,
      quantity: 10,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: '4',
      name: 'Smoothies #1',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1526424382096-74a93e105682?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 2.99,
      quantity: 10,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '5',
      name: 'Smoothies #2',
      category: 'Smoothies',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imageUrl:
          'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80', //https://unsplash.com/photos/CrK843Pl9a4
      price: 2.99,
      quantity: 10,
      isRecommended: false,
      isPopular: false,
    ),
  ];
}
