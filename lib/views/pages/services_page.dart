import 'package:admin_/controller/category_controller.dart';
import 'package:admin_/model/category_model.dart';
import 'package:admin_/model/services_model.dart';
import 'package:admin_/utils/constants.dart';
import 'package:admin_/views/components/my_button.dart';
import 'package:admin_/views/components/DataTables/services_table.dart';
import 'package:admin_/views/components/side_drawer.dart';
import 'package:admin_/views/pages/forms/add_edit_category_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'forms/add_edit_service_form.dart';

class ServicesPage extends StatefulWidget {
  ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _HomePageState();
}

class _HomePageState extends State<ServicesPage> {
  final CategoryController categoryController = Get.find<CategoryController>();
  late List<Category> _categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Row(
            children: [
              const SideDrawer(),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 1000,
                      color: primaryColor,
                      child: const Center(
                        child: Text(
                          "Services",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 25,
                            color: Color.fromARGB(255, 251, 251, 251),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [ServicesTable()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child: MyButton(
                            onTap: () {
                              openCategoryForm();
                            },
                            buttonName: 'Add Category',
                          ),
                        ),
                        // SizedBox(
                        //   width: 200,
                        //   child: MyButton(
                        //     onTap: () {
                        //       openServiceForm();
                        //     },
                        //     buttonName: 'Add Service',
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void openCategoryForm() => showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            //title: Text("Add Category"),
            content: AddEditCategoryForm(),
          )));

  // void openServiceForm() => showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         insetPadding: const EdgeInsets.symmetric(horizontal: 100),
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  //         child: const AddEditServiceForm(), //this right here
  //       );
  //     });
}
