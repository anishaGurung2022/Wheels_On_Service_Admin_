import 'package:admin_/controller/category_controller.dart';
import 'package:admin_/controller/service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomersTable extends StatelessWidget {
  final CategoryController categoriesController = Get.put(CategoryController());
  CustomersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return buildServicesDataTable();
  }

  Widget buildServicesDataTable() {
    final columns = ['S.N', 'Catgeory Name', 'Description'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          DataTable(
              columns: getColumns(columns),
              rows: categoriesController.categories
                  .map((category) => DataRow(
                        cells: [
                          DataCell(Text(category.id.toString())),
                          DataCell(Text(category.name)),
                          DataCell(Text(category.description)),
                        ],
                      ))
                  .toList()),
        ],
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(label: Text(column));
    }).toList();
  }
}
