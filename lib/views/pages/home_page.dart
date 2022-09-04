import 'package:admin_/utils/constants.dart';
import 'package:admin_/views/components/my_button.dart';
import 'package:admin_/views/components/side_drawer.dart';
import 'package:admin_/views/pages/forms/add_edit_category_form.dart';
import 'package:admin_/views/pages/forms/add_edit_product_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Text('Home'), backgroundColor: primaryColor),
        backgroundColor: backgroundColor,
        drawer: SideDrawer(),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
          ),
        ));
  }
}
