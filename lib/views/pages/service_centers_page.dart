import 'package:admin_/utils/constants.dart';
import 'package:admin_/views/components/side_drawer.dart';
import 'package:flutter/material.dart';

class ServiceCentresPage extends StatelessWidget {
  const ServiceCentresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Row(
            children: [
              const SideDrawer(),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 1000,
                      color: primaryColor,
                      child: const Center(
                        child: Text(
                          "Service Centers",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 25,
                            color: Color.fromARGB(255, 251, 251, 251),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
