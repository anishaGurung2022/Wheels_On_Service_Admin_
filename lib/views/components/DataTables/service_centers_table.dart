import 'package:admin_/controller/service_center_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceCentersTable extends StatelessWidget {
  final ServiceCenterController serviceCenterController =
      Get.put(ServiceCenterController());
  ServiceCentersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return buildServicesDataTable();
  }

  Widget buildServicesDataTable() {
    final columns = [
      'S.N',
      'Name',
      'Phone',
      'Cities',
      'Email',
      'User Name',
      'Image'
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          DataTable(
              columns: getColumns(columns),
              rows: serviceCenterController.serviceCenters
                  .map((serviceCenter) => DataRow(
                        cells: [
                          DataCell(Text(serviceCenter.id.toString())),
                          DataCell(Text(serviceCenter.name)),
                          DataCell(Text(serviceCenter.phone)),
                          DataCell(Text(serviceCenter.cities)),
                          DataCell(Text(serviceCenter.email)),
                          DataCell(Text(serviceCenter.userName)),
                          DataCell(Text(serviceCenter.image)),
                        ],
                      ))
                  .toList()),
        ],
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
          label: Text(
        column,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));
    }).toList();
  }
}
