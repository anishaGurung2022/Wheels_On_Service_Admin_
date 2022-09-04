import 'package:admin_/controller/authentication_controller.dart';
import 'package:admin_/utils/constants.dart';
import 'package:admin_/utils/shared_prefs.dart';
import 'package:admin_/views/components/my_button.dart';
import 'package:admin_/views/components/my_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authentication = Get.find<Authentication>();
  final AuthService authService = AuthService();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
                key: formKey,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                          height: 250,
                          width: 300,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/logo.jpg'),
                                    fit: BoxFit.fill)),
                          )),
                      const Text("Login",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w800,
                              color: primaryColor)),
                      const SizedBox(height: 20),
                      MyField(
                        controller: emailController,
                        labelText: 'Email',
                        myTextValidator: (value) {
                          if (!value.toString().contains("@")) {
                            return "Email is not valid";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      MyField(
                        controller: passwordController,
                        labelText: 'Password',
                        obscureText: true,
                        myTextValidator: (value) {
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      MyButton(
                        onTap: () {
                          var isFormValid = formKey.currentState!.validate();
                          if (isFormValid) {
                            var data = {
                              "email": emailController.text,
                              "password": passwordController.text
                            };
                            authentication.login(data);
                          }
                        },
                        buttonName: "Login",
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}
