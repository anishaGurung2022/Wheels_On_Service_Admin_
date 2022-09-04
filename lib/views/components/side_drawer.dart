import 'package:admin_/controller/authentication_controller.dart';
import 'package:admin_/utils/shared_prefs.dart';
import 'package:admin_/views/pages/home_page.dart';
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
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff203E64),
            ),
            child: Center(
              child: Text(
                'Admin',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Get.to(const HomePage()),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Users'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.car_repair_sharp),
            title: const Text('Services'),
            onTap: () => Get.to(const ServicesPage()),
          ),
          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text('Service Centers'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
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
