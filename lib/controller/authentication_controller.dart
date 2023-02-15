import 'dart:convert';
import 'package:admin_/utils/constants.dart';
import 'package:admin_/views/pages/loader.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:admin_/utils/api.dart';
import 'package:admin_/utils/shared_prefs.dart';

class Authentication extends GetxController {
  final authService = AuthService();

  login(data) async {
    var url = Uri.parse(LOGIN_API);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      // Converting json response into Map (list with key and its value)
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        //when success is true save token in ROM
        await authService.saveToken(jsonResponse["token"]);
        Get.offAll(const Loader());
        showMessage(
            title: "Success",
            message: jsonResponse["message"],
            isSuccess: true);
      } else {
        showMessage(
            title: "Error", message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  logout() async {
    var url = Uri.parse(LOGOUT_API);
    var token_ = await authService.getToken();
    var response = await http.post(url, body: {
      "token": token_
    }, headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          'true', // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        await authService.removeToken();
        Get.offAll(const Loader());
        showMessage(
            title: "Success",
            message: jsonResponse["message"],
            isSuccess: true);
      } else {
        showMessage(
            title: "Error", message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
