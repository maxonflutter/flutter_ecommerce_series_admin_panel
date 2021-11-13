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
}
