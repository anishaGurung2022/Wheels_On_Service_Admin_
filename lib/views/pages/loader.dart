import 'package:admin_/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/shared_prefs.dart';
import 'home_page.dart';
import 'login_page.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    checkifAuthenticated();
  }

  checkifAuthenticated() async {
    await Future.delayed(const Duration(seconds: 3));
    var token = await authService.getToken();
    if (token != null) {
      Get.offAll(HomePage());
    } else {
      Get.offAll(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.fill)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
