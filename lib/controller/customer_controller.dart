import 'dart:convert';
import 'package:admin_/model/customers_model.dart';
import 'package:admin_/utils/constants.dart';
import 'package:admin_/utils/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../utils/api.dart';

class CustomerController extends GetxController {
  var loading = false.obs;
  var customers = <Customers>[].obs;
  var customerCount = "".obs;
  final AuthService authService = AuthService();

  @override
  void onInit() {
    super.onInit();
    get();
  }

  get() async {
    loading.value = true;
    var url = Uri.parse(GET_CUSTOMER_API);
    var response = await http.get(url, headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          'true', // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
    });
    loading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        customerCount.value = jsonResponse["count"].toString();
        var responseData = jsonResponse['data'];
        for (var i = 0; i < responseData.length; i++) {
          customers.add(Customers.fromJson(responseData[i]));
        }
        //showMessage(title: "Success", message: jsonResponse["message"]);
      } else {
        showMessage(
            title: "Error", message: jsonResponse["message"], isSuccess: false);
      }
    }
  }
}
