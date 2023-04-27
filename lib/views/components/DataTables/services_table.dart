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
                          DataCell(SizedBox(
                            height:
                                60, // Set the height to limit the text to a specific height
                            child: Text(service.description,
                                style: const TextStyle(fontSize: 14)),
                          )),
                          DataCell(Text(service.price.toString())),
                          DataCell(Text(service.category)),
                          DataCell(Text(service.serviceCenter)),
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
