import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_backend/controllers/product_controller.dart';
import 'package:get/get.dart';

import '/models/models.dart';
import '/screens/screens.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  final ProductController productController = Get.put(
    ProductController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildAddNewProduct(),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: productController.products.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 210,
                      child: _buildProductCard(
                          index, productController.products[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card _buildProductCard(int index, Product product) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 50,
                            child: Text(
                              'Price',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 175,
                            child: Slider(
                              value: product.price,
                              min: 0,
                              max: 25,
                              divisions: 10,
                              activeColor: Colors.black,
                              inactiveColor: Colors.black12,
                              onChanged: (value) {
                                productController.updateProductPrice(
                                  index,
                                  product,
                                  value,
                                );
                              },
                            ),
                          ),
                          Text(
                            '\$${product.price.toStringAsFixed(1)}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 50,
                            child: Text(
                              'Qty.',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 175,
                            child: Slider(
                              value: product.quantity.toDouble(),
                              min: 0,
                              max: 100,
                              divisions: 10,
                              activeColor: Colors.black,
                              inactiveColor: Colors.black12,
                              onChanged: (value) {
                                productController.updateProductQuantity(
                                  index,
                                  product,
                                  value.toInt(),
                                );
                              },
                            ),
                          ),
                          Text(
                            '${product.quantity.toInt()}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildAddNewProduct() {
    return SizedBox(
      height: 100,
      child: Card(
        color: Colors.black,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.to(() => NewProductScreen());
                },
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Add a New Product',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}