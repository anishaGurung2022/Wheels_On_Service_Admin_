import 'package:admin_/controller/service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesTable extends StatelessWidget {
  final ServiceController serviceController = Get.put(ServiceController());
  ServicesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return buildServicesDataTable();
  }

  Widget buildServicesDataTable() {
    final columns = [
      'S.N',
      'Name',
      'Description',
      'Price',
      'Category',
      'Service Center Name',
      'image'
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          DataTable(
              columns: getColumns(columns),
              rows: serviceController.services
                  .map((service) => DataRow(
                        cells: [
                          DataCell(Text(service.id.toString())),
                          DataCell(Text(service.name)),
                          DataCell(Text(service.description)),
                          DataCell(Text(service.price.toString())),
                          DataCell(Text(service.category)),
                          DataCell(Text(service.serviceCenter)),
                          DataCell(Text(service.image)),
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
          label: Text(column,
              style: const TextStyle(fontWeight: FontWeight.bold)));
    }).toList();
  }
}
