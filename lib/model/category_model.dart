import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// class CategoryDataSource extends DataGridSource {
//   //var categories;

//   CategoryDataSource(this.categories) {
//     buildDataGridRow();
//   }

//   void buildDataGridRow() {
//     _categoryDataGridRows = categories
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//               DataGridCell<String>(columnName: 'Id', value: e.id),
//               DataGridCell<String>(columnName: 'Name', value: e.name),
//               DataGridCell<String>(
//                   columnName: 'Description', value: e.description),
//               //DataGridCell<int>(columnName: 'salary', value: e.salary),
//             ]))
//         .toList();
//   }

//   List<Category> categories = [];

//   List<DataGridRow> _categoryDataGridRows = [];

//   @override
//   List<DataGridRow> get rows => _categoryDataGridRows;
//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//       return Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(8.0),
//         child: Text(e.value.toString()),
//       );
//     }).toList());
//   }

//   void updateDataGrid() {
//     notifyListeners();
//   }
// }

class Category {
  Category({
    required this.id,
    required this.name,
    required this.description,
  });

  String id;
  String name;
  String description;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
