import 'dart:convert';
import 'package:admin_/model/bookings_model.dart';
import 'package:admin_/utils/api.dart';
import 'package:admin_/utils/constants.dart';
import 'package:admin_/utils/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class BookingController extends GetxController {
  var loading = false.obs;
  final AuthService authService = AuthService();
  var bookings = <Bookings>[].obs;
  List<Bookings> get bookingsList => bookings.toList();

  @override
  void onInit() async {
    super.onInit();
    var token_ = await authService.getToken();
    get(token_);
  }

  get(token_) async {
    loading.value = true;
    var url = Uri.parse(GET_BOOKINGS_API);
    var response = await http.post(url, body: {"token": token_});
    loading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        var responseData = jsonResponse['data'];
        for (var i = 0; i < responseData.length; i++) {
          bookings.add(Bookings.fromJson(responseData[i]));
        }
      } else {
        showMessage(
            message: jsonResponse["message"],
            isSuccess: false,
            title: 'Success');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
