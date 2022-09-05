import 'dart:convert';
import 'package:admin_/utils/api.dart';
import 'package:admin_/utils/constants.dart';
import 'package:admin_/utils/shared_prefs.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    var categories = get();
  }

  var loading = false.obs;
  final AuthService authService = AuthService();

  //GET categories from database
  get() async {
    var url = Uri.parse(GET_CATEGORIES_API);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        Get.back();
        showMessage(title: "Success", message: jsonResponse["message"]);
      } else {
        showMessage(
            title: "Error", message: jsonResponse["message"], isSuccess: false);
      }
    }
  }

  add(data) async {
    loading.value = true;
    data['token'] = await authService.getToken();
    var url = Uri.parse(ADD_CATEGORY_API);
    await Future.delayed(const Duration(seconds: 3));
    var response = await http.post(url, body: data);
    loading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        Get.back();
        showMessage(title: "Success", message: jsonResponse["message"]);
      } else {
        showMessage(
            title: "Error", message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
