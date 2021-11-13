import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My eCommerce Backend',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/products', page: () => ProductsScreen()),
        GetPage(name: '/products/new', page: () => const NewProductScreen())
      ],
    );
  }
}
