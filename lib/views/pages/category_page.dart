import 'package:admin_/utils/constants.dart';
import 'package:admin_/views/components/my_button.dart';
import 'package:admin_/views/components/side_drawer.dart';
import 'package:admin_/views/pages/forms/add_edit_category_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Categories',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          backgroundColor: primaryColor),
      drawer: const SideDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              MyButton(
                onTap: () {
                  Get.bottomSheet(AddEditCategoryForm());
                },
                buttonName: 'Add Category',
              ),
              // Container(
              //     height: 350,
              //     width: 450,
              //     decoration: BoxDecoration(
              //         color: const Color(0xffffffff),
              //         border: Border.all(width: 1.0, color: Colors.black),
              //         boxShadow: const [
              //           BoxShadow(
              //             color: Color.fromARGB(255, 189, 189, 189),
              //             offset: Offset(0, 3),
              //             blurRadius: 6,
              //           ),
              //         ]),
              //     child: AddEditCategoryForm()),
              const SizedBox(
                height: 30,
              ),

              // MyButton(
              //   onTap: () {
              //     Get.bottomSheet(AddEditServiceForm());
              //   },
              //   buttonName: 'Add Service',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
