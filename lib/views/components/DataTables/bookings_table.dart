import 'package:admin_/controller/booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingsTable extends StatelessWidget {
  final BookingController bookingController = Get.put(BookingController());
  BookingsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return buildBookingsDataTable();
  }

  Widget buildBookingsDataTable() {
    final columns = [
      'S.N',
      'Customer Name',
      'Service Center Name',
      'Booking Date and Time',
      'Total Cost',
      'Payment'
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          DataTable(
              columns: getColumns(columns),
              rows: bookingController.bookings
                  .map((booking) => DataRow(
                        cells: [
                          DataCell(Text(booking.id.toString())),
                          DataCell(Text(booking.customer)),
                          DataCell(Text(booking.serviceCenter)),
                          DataCell(Text(booking.bookingDate.toString())),
                          DataCell(Text(booking.total.toString())),
                          DataCell(Text(booking.isPaid == 0
                              ? 'paid'
                              : 'unpaid')), // use ternary operator to conditionally display text
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
