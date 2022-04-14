import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_backend/models/product_model.dart';
import 'package:flutter_ecommerce_backend/services/database_service.dart';
import 'package:flutter_ecommerce_backend/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '/controllers/controllers.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({Key? key}) : super(key: key);

  final ProductController productController = Get.find();

  StorageService storage = StorageService();
  DatabaseService database = DatabaseService();

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Smoothies',
      'Soft Drinks',
      'Water',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Product'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Colors.black,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          ImagePicker _picker = ImagePicker();
                          final XFile? _image = await _picker.pickImage(
                              source: ImageSource.gallery);

                          if (_image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No image was selected.'),
                              ),
                            );
                          }

                          if (_image != null) {
                            await storage.uploadImage(_image);
                            var imageUrl =
                                await storage.getDownloadURL(_image.name);

                            productController.newProduct.update(
                                'imageUrl', (_) => imageUrl,
                                ifAbsent: () => imageUrl);
                          }
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Add an Image',
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
              const SizedBox(height: 20),
              const Text(
                'Product Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildTextFormField(
                'Product Name',
                'name',
                productController,
              ),
              _buildTextFormField(
                'Product Description',
                'description',
                productController,
              ),
              DropdownButtonFormField(
                iconSize: 20,
                decoration: const InputDecoration(hintText: 'Product Category'),
                items: categories.map(
                  (value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  productController.newProduct.update(
                    'category',
                    (_) => value,
                    ifAbsent: () => value,
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildSlider(
                'Price',
                'price',
                productController,
                productController.price,
              ),
              _buildSlider(
                'Quantity',
                'quantity',
                productController,
                productController.quantity,
              ),
              const SizedBox(height: 10),
              _buildCheckbox(
                'Recommended',
                'isRecommended',
                productController,
                productController.isRecommended,
              ),
              _buildCheckbox(
                'Popular',
                'isPopular',
                productController,
                productController.isPopular,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    database.addProduct(
                      Product(
                        name: productController.newProduct['name'],
                        category: productController.newProduct['category'],
                        description:
                            productController.newProduct['description'],
                        imageUrl: productController.newProduct['imageUrl'],
                        isRecommended:
                            productController.newProduct['isRecommended'] ??
                                false,
                        isPopular:
                            productController.newProduct['isPopular'] ?? false,
                        price: productController.newProduct['price'],
                        quantity:
                            productController.newProduct['quantity'].toInt(),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildCheckbox(
    String title,
    String name,
    ProductController productController,
    bool? controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Checkbox(
          value: (controllerValue == null) ? false : controllerValue,
          checkColor: Colors.black,
          activeColor: Colors.black12,
          onChanged: (value) {
            productController.newProduct.update(
              name,
              (_) => value,
              ifAbsent: () => value,
            );
          },
        ),
      ],
    );
  }

  Row _buildSlider(
    String title,
    String name,
    ProductController productController,
    double? controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Slider(
            value: (controllerValue == null) ? 0 : controllerValue,
            min: 0,
            max: 25,
            divisions: 10,
            activeColor: Colors.black,
            inactiveColor: Colors.black12,
            onChanged: (value) {
              productController.newProduct.update(
                name,
                (_) => value,
                ifAbsent: () => value,
              );
            },
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(
    String hintText,
    String name,
    ProductController productController,
  ) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: (value) {
        productController.newProduct.update(
          name,
          (_) => value,
          ifAbsent: () => value,
        );
      },
    );
  }
}
