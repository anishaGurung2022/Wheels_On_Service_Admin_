import 'package:admin_/controller/booking_controller.dart';
import 'package:admin_/controller/customer_controller.dart';
import 'package:admin_/controller/service_center_controller.dart';
import 'package:admin_/controller/service_controller.dart';
import 'package:admin_/utils/constants.dart';
import 'package:admin_/views/components/DataTables/bookings_table.dart';
import 'package:admin_/views/components/side_drawer.dart';
import 'package:admin_/views/pages/customers_page.dart';
import 'package:admin_/views/pages/service_centers_page.dart';
import 'package:admin_/views/pages/services_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  BookingController bookingController = Get.put(BookingController());
  ServiceController serviceController = Get.put(ServiceController());
  CustomerController customerController = Get.put(CustomerController());
  ServiceCenterController serviceCenterController =
      Get.put(ServiceCenterController());

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ServiceController serviceController = Get.put(ServiceController());
  CustomerController customerController = Get.put(CustomerController());
  ServiceCenterController serviceCenterController =
      Get.put(ServiceCenterController());

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
                          "Dashboard",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 25,
                            color: Color.fromARGB(255, 251, 251, 251),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (() => Get.to(const CustomersPage())),
                            child: Container(
                                height: 90,
                                width: 160,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: primaryColor,
                                    width: 1.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: primaryColor.withOpacity(1.0),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Customers",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: backgroundColor,
                                          fontSize: 25),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      serviceController.servicesCount.value,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: backgroundColor,
                                          fontSize: 30),
                                    ),
                                  ],
                                )),
                          ),
                          InkWell(
                            onTap: (() => Get.to(const ServiceCentresPage())),
                            child: Container(
                                height: 90,
                                width: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: primaryColor,
                                    width: 1.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: primaryColor.withOpacity(1.0),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Service Centers",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: backgroundColor,
                                          fontSize: 25),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      serviceCenterController
                                          .serviceCenterCount.value,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: backgroundColor,
                                          fontSize: 30),
                                    ),
                                  ],
                                )),
                          ),
                          InkWell(
                            onTap: (() => Get.to(ServicesPage())),
                            child: Container(
                                height: 90,
                                width: 160,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: primaryColor,
                                    width: 1.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: primaryColor.withOpacity(1.0),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Services",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: backgroundColor,
                                          fontSize: 25),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      serviceController.servicesCount.value,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: backgroundColor,
                                          fontSize: 30),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [BookingsTable()],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
