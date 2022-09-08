import 'dart:convert';
import 'dart:io';
import 'package:admin_/controller/category_controller.dart';
import 'package:admin_/controller/product_controller.dart';
import 'package:admin_/model/category_model.dart';
import 'package:admin_/utils/constants.dart';
import 'package:admin_/views/components/my_button.dart';
import 'package:admin_/views/components/my_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

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
  final CategoryController categoryController = Get.find<CategoryController>();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            // height: 300,
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                        const SizedBox(height: 20),
                        const SizedBox(height: 15),
                        Obx(() => DropdownButtonHideUnderline(
                                child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: const [
                                  Icon(
                                    Icons.list,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Select Category',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              //selected value
                              value: categoryController.selectedCategory.value,
                              //fetching data from Category Controller
                              items: categoryController.categories.value
                                  .map((item) => DropdownMenuItem<Category>(
                                        value: item,
                                        child: Text(
                                          item.name,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                categoryController.selectedCategory.value =
                                    value as Category;
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.grey[200],
                              buttonHeight: 50,
                              buttonWidth: 355,
                              buttonPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              buttonDecoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: Colors.grey,
                              ),
                              buttonElevation: 2,
                              itemHeight: 40,
                              itemPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownWidth: 200,
                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.grey[200],
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(-20, 0),
                            ))),
                        const SizedBox(height: 15),
                      ],
                    ),
                    // to make container clickable use INKWELL
                    InkWell(
                        //port where image selected
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
                    const SizedBox(height: 15),
                    MyButton(
                        onTap: () {
                          var selectedCategory =
                              categoryController.selectedCategory.toJson();

                          if (_formKey.currentState!.validate()) {
                            var data = {
                              "name": _nameController.text,
                              "price": priceController.text,
                              "description": _descriptionController.text,
                              "categoryID": selectedCategory['id']
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
        ),
      ),
    );
  }
}
