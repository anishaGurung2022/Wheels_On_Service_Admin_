import 'package:admin_/controller/category_controller.dart';
import 'package:admin_/utils/constants.dart';
import 'package:admin_/views/components/my_button.dart';
import 'package:admin_/views/components/my_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEditCategoryForm extends StatelessWidget {
  final String title;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final CategoryController categoryController = Get.put(CategoryController());
  AddEditCategoryForm({Key? key, this.title = "Add Category"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: primaryColor)),
              Column(
                children: [
                  MyField(
                    controller: _nameController,
                    labelText: 'Category Name',
                  ),
                  MyField(
                    controller: _descriptionController,
                    labelText: 'Category Description',
                  ),
                ],
              ),
              MyButton(
                onTap: () {
                  var data = {
                    'name': _nameController.text,
                    'description': _descriptionController.text
                  };
                  var isValidated = _formKey.currentState!.validate();
                  if (isValidated) {
                    categoryController.add(data);
                  }
                },
                buttonName: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
