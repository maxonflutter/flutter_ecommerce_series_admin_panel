import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '/controllers/controllers.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({Key? key}) : super(key: key);

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Product'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
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

                        if (_image != null) {}
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Add a New Picture',
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
            const SizedBox(height: 10),
            _buildTextFormField('Product Id'),
            _buildTextFormField('Product Name'),
            _buildTextFormField('Product Description'),
            _buildTextFormField('Category'),
            const SizedBox(height: 10),
            _buildSlider('Price'),
            _buildSlider('Quantity'),
            const SizedBox(height: 10),
            _buildCheckbox('Recommended'),
            _buildCheckbox('Popular'),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  productController.addProduct();
                },
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildCheckbox(
    String title,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
          value: true,
          checkColor: Colors.black,
          activeColor: Colors.black12,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Row _buildSlider(
    String title,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            value: 10,
            min: 0,
            max: 25,
            divisions: 10,
            activeColor: Colors.black,
            inactiveColor: Colors.black12,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(
    String title,
  ) {
    return TextFormField(
      decoration: InputDecoration(hintText: title),
      onChanged: (value) {
        // productController.productName.value = value;
      },
    );
  }
}
