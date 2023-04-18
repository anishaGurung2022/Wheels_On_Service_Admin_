import 'package:admin_/controller/authentication_controller.dart';
import 'package:admin_/utils/constants.dart';
import 'package:admin_/utils/shared_prefs.dart';
import 'package:admin_/views/pages/customers_page.dart';
import 'package:admin_/views/pages/home_page.dart';
import 'package:admin_/views/pages/service_centers_page.dart';
import 'package:admin_/views/pages/services_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  final authService = AuthService();
  final authentication = Get.find<Authentication>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    //border: Border.all(),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.cover),
                  )),
              // child: Image.asset("assets/images/logo.png"),
              // Text("Admin")
            ],
          ),
          ListTile(
            leading: const Icon(Icons.home),
            iconColor: primaryColor,
            selectedColor: Colors.grey,
            title: const Text(
              'Dashboard',
              style:
                  TextStyle(fontWeight: FontWeight.w900, fontFamily: 'Roboto'),
            ),
            onTap: () => Get.to(const HomePage()),
          ),
          ListTile(
            title: const Text(
              "Services",
              style:
                  TextStyle(fontWeight: FontWeight.w900, fontFamily: 'Roboto'),
            ),
            leading: const Icon(Icons.car_repair_sharp), //add icon
            iconColor: primaryColor,
            onTap: (() => Get.to(ServicesPage())),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            iconColor: primaryColor,
            title: const Text('Customers',
                style: TextStyle(
                    fontWeight: FontWeight.w900, fontFamily: 'Roboto')),
            onTap: () => Get.to(const CustomersPage()),
          ),
          ListTile(
            leading: const Icon(Icons.home_filled),
            iconColor: primaryColor,
            title: const Text('Service Centers',
                style: TextStyle(
                    fontWeight: FontWeight.w900, fontFamily: 'Roboto')),
            onTap: () => Get.to(const ServiceCentresPage()),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            iconColor: primaryColor,
            title: const Text('Logout',
                style: TextStyle(
                    fontWeight: FontWeight.w900, fontFamily: 'Roboto')),
            onTap: () => logout(),
          ),
        ],
      ),
    );
  }

  logout() async {
    await authentication.logout();
  }
}
