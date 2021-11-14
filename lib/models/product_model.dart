import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String description;
  final String category;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  double price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    required this.price,
    required this.quantity,
  });

  Product copyWith({
    int? id,
    String? name,
    String? description,
    String? category,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      isRecommended: isRecommended ?? this.isRecommended,
      isPopular: isPopular ?? this.isPopular,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      category: map['category'],
      imageUrl: map['imageUrl'],
      isRecommended: map['isRecommended'],
      isPopular: map['isPopular'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      category,
      imageUrl,
      isRecommended,
      isPopular,
      price,
      quantity,
    ];
  }

  static List<Product> products = [
    Product(
      id: 1,
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
      id: 2,
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
      id: 3,
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
      id: 4,
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
      id: 5,
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


  // Product({
  //   required this.id,
  //   required this.name,
  //   required this.description,
  //   required this.category,
  //   required this.imageUrl,
  //   required this.isRecommended,
  //   required this.isPopular,
  //   this.price = 0.0,
  //   this.quantity = 0,
  // });

  // static Product fromSnapshot(DocumentSnapshot snap) {
  //   Product product = Product(
  //     id: snap['id'],
  //     name: snap['name'],
  //     description: snap['description'],
  //     category: snap['category'],
  //     imageUrl: snap['imageUrl'],
  //     price: snap['price'],
  //     quantity: snap['quantity'],
  //     isRecommended: snap['isRecommended'],
  //     isPopular: snap['isPopular'],
  //   );
  //   return product;
  // }

  // Map<String, dynamic> toDocument() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'description': description,
  //     'category': category,
  //     'imageUrl': imageUrl,
  //     'price': price,
  //     'quantity': quantity,
  //     'isRecommended': isRecommended,
  //     'isPopular': isPopular,
  //   };
  // }

  // @override
  // List<Object?> get props => [
  //       id,
  //       name,
  //       description,
  //       category,
  //       imageUrl,
  //       price,
  //       quantity,
  //       isRecommended,
  //       isPopular,
  //     ];
