import 'package:admin_/utils/constants.dart';
import 'package:admin_/views/components/my_button.dart';
import 'package:admin_/views/components/my_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddEditProductForm extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  final String title;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  AddEditProductForm({Key? key, this.title = "Add Product"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  Text(title, style: const TextStyle(fontSize: 20)),
                  Column(
                    children: [
                      MyField(
                        controller: _nameController,
                        labelText: 'Product Name',
                      ),
                      MyField(
                        controller: _descriptionController,
                        labelText: ' description',
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(Container(
                          height: 300,
                          color: backgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.all(70.0),
                            child: Column(
                              children: [
                                MyButton(
                                  onTap: () async {
                                    final pickedFile = await _picker.getImage(
                                      source: ImageSource.gallery,
                                    );
                                    if (pickedFile != null) {
                                      Get.back();
                                    }
                                  },
                                  buttonName: 'Gallery',
                                ),
                                const SizedBox(height: 30),
                                MyButton(onTap: () {}, buttonName: 'Camera')
                              ],
                            ),
                          )));
                    },
                    child: Container(
                      width: Get.width / 2,
                      height: Get.height / 4,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.add_a_photo),
                    ),
                  ),
                  MyButton(
                    onTap: () {
                      Get.back();
                    },
                    buttonName: 'Save',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
