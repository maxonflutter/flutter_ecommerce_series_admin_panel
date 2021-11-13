import 'package:flutter_ecommerce_backend/models/models.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Product> products = Product.products.obs;

  void updateProductPrice(
    int index,
    Product product,
    double value,
  ) {
    product.price = value;
    products[index] = product;
  }

  void updateProductQuantity(
    int index,
    Product product,
    int value,
  ) {
    product.quantity = value;
    products[index] = product;
  }

  void addProduct() {
    products.add(
      Product(
        id: 6,
        name: 'Soft Drink #111',
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
    );
  }
}
