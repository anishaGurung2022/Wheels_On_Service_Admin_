import 'dart:io';
import 'package:admin_/controller/product_controller.dart';
import 'package:admin_/utils/constants.dart';
import 'package:admin_/views/components/my_button.dart';
import 'package:admin_/views/components/my_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddEditProductForm extends StatefulWidget {
  final String title;

  const AddEditProductForm({Key? key, this.title = "Add Product"})
      : super(key: key);

  @override
  State<AddEditProductForm> createState() => _AddEditProductFormState();
}

class _AddEditProductFormState extends State<AddEditProductForm> {
  final ImagePicker _picker = ImagePicker();

  PickedFile? pickedFile;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryIdController = TextEditingController();
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 300,
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: const TextStyle(fontSize: 20)),
                Column(
                  children: [
                    MyField(
                      labelText: "Product Name",
                      controller: _nameController,
                    ),
                    MyField(
                      labelText: "Product description",
                      controller: _descriptionController,
                    ),
                    MyField(
                      labelText: "Price",
                      controller: priceController,
                    ),
                    MyField(
                      labelText: "Category ID",
                      controller: categoryIdController,
                    ),
                  ],
                ),
                InkWell(
                    onTap: () async {
                      pickedFile = await _picker.getImage(
                        source: ImageSource.gallery,
                      );
                      setState(() {});
                      if (pickedFile != null) {
                        // Get.back();
                      }
                    },
                    child: (pickedFile == null)
                        ? Container(
                            width: Get.width / 2,
                            height: Get.height / 4,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.add_a_photo),
                          )
                        : Container(
                            width: Get.width / 2,
                            height: Get.height / 4,
                            decoration: BoxDecoration(
                              //image from file
                              image: DecorationImage(
                                  image: FileImage(
                                    File(pickedFile!.path),
                                  ),
                                  fit: BoxFit.cover),
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.add_a_photo),
                          )),
                MyButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        var data = {
                          "name": _nameController.text,
                          "price": priceController.text,
                          "description": _descriptionController.text,
                          "category_id": categoryIdController.text,
                        };
                        productController.add(data, pickedFile);
                      }
                    },
                    buttonName: 'Save'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
