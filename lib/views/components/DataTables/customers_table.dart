import 'package:admin_/controller/customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomersTable extends StatelessWidget {
  final CustomerController customerController = Get.put(CustomerController());
  CustomersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return buildCustomersDataTable();
  }

  Widget buildCustomersDataTable() {
    final columns = [
      'S.N',
      'Name',
      'Phone',
      'Address',
      'Email',
      'User Name',
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          DataTable(
              columns: getColumns(columns),
              rows: customerController.customers
                  .map((customer) => DataRow(
                        cells: [
                          DataCell(Text(customer.id.toString())),
                          DataCell(Text(customer.name)),
                          DataCell(Text(customer.phone)),
                          DataCell(Text(customer.address)),
                          DataCell(Text(customer.email)),
                          DataCell(Text(customer.userName)),
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
