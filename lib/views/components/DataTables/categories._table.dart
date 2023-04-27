import 'package:admin_/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatagoriesTable extends StatelessWidget {
  final CategoryController categoriesController = Get.put(CategoryController());
  CatagoriesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return buildCategoriesDataTable();
  }

  Widget buildCategoriesDataTable() {
    final columns = ['S.N', 'Category Name', 'Description', 'Actions'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          DataTable(
            columns: getColumns(columns),
            rows: categoriesController.categories
                .map(
                  (category) => DataRow(
                    cells: [
                      DataCell(Text(category.id.toString())),
                      DataCell(Text(category.name)),
                      DataCell(Text(category.description)),
                      DataCell(Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Handle edit button press
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Handle delete button press
                            },
                          ),
                        ],
                      )),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map(
      (String column) {
        return DataColumn(
            label: Text(
          column,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
      },
    ).toList();
  }
}
