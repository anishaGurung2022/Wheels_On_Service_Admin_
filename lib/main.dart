import 'package:admin_/controller/category_controller.dart';
import 'package:admin_/controller/customer_controller.dart';
import 'package:admin_/controller/service_center_controller.dart';
import 'package:admin_/controller/service_controller.dart';
import 'package:admin_/views/pages/home_page.dart';
import 'package:admin_/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin_/controller/authentication_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Authentication());
  Get.put(CategoryController());
  Get.put(ServiceController());
  Get.put(ServiceCenterController());
  Get.put(CustomerController());
  runApp(GetMaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}
