import 'package:admin_/utils/constants.dart';
import 'package:admin_/views/components/my_button.dart';
import 'package:admin_/views/components/side_drawer.dart';
import 'package:admin_/views/pages/forms/add_edit_category_form.dart';
import 'package:admin_/views/pages/forms/add_edit_product_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _HomePageState();
}

class _HomePageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Services'), backgroundColor: primaryColor),
        backgroundColor: backgroundColor,
        drawer: SideDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MyButton(
                  onTap: () {
                    Get.bottomSheet(AddEditCategoryForm());
                  },
                  buttonName: 'Add Category',
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  onTap: () {
                    Get.to(AddEditProductForm());
                  },
                  buttonName: 'Add Product',
                ),
              ],
            ),
          ),
        ));
  }
}
