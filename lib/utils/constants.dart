import 'package:flutter/material.dart';
import 'package:get/get.dart';

const primaryColor = Color(0xff203E64);
const backgroundColor = Colors.white;

showMessage(
    {required String title, required String message, isSuccess = true}) {
  Get.snackbar(
    title,
    message,
    colorText: Colors.white,
    backgroundColor: isSuccess ? Colors.green : Colors.red,
  );
}
