import 'package:admin_/controller/authentication_controller.dart';
import 'package:admin_/controller/booking_controller.dart';
import 'package:admin_/utils/constants.dart';
import 'package:admin_/utils/shared_prefs.dart';
import 'package:admin_/views/components/my_button.dart';
import 'package:admin_/views/components/my_field.dart';
import 'package:admin_/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authentication = Get.find<Authentication>();
  BookingController bookingController = Get.put(BookingController());
  final AuthService authService = AuthService();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
                key: formKey,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Container(
                        height: 500,
                        width: 900,
                        color: backgroundColor,
                        child: Row(
                          children: [
                            SizedBox(
                                height: 400,
                                width: 450,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/logo.png'),
                                          fit: BoxFit.fill)),
                                )),
                            Container(
                              color: const Color.fromARGB(255, 233, 238, 241),
                              width: 450,
                              child: Column(children: [
                                const SizedBox(
                                  height: 140,
                                ),
                                const Text(
                                  'Welcome!',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 25,
                                    color: Color(0xff1c1919),
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                MyField(
                                  controller: emailController,
                                  labelText: 'Email',
                                  prefixIcon: const Icon(Icons.email),
                                  myTextValidator: (value) {
                                    if (!value.toString().contains("@")) {
                                      return "Email is not valid";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  child: MyField(
                                    controller: passwordController,
                                    labelText: 'Password',
                                    obscureText: true,
                                    myTextValidator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 200,
                                  child: MyButton(
                                    buttonName: 'Login',
                                    onTap: () {
                                      var isFormValid =
                                          formKey.currentState!.validate();
                                      if (isFormValid) {
                                        var data = {
                                          "email": emailController.text,
                                          "password": passwordController.text
                                        };
                                        authentication.login(data);
                                      }
                                    },
                                  ),
                                )
                              ]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}
