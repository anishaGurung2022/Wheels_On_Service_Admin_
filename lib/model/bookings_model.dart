// To parse this JSON data, do
//
//     final bookings = bookingsFromJson(jsonString);

import 'dart:convert';

Bookings bookingsFromJson(String str) => Bookings.fromJson(json.decode(str));

String bookingsToJson(Bookings data) => json.encode(data.toJson());

class Bookings {
  String id;
  String customer;
  String serviceCenter;
  DateTime bookingDate;
  String total;
  String isPaid;

  Bookings({
    required this.id,
    required this.customer,
    required this.serviceCenter,
    required this.bookingDate,
    required this.total,
    required this.isPaid,
  });

  factory Bookings.fromJson(Map<String, dynamic> json) => Bookings(
        id: json["id"],
        customer: json["customer"],
        serviceCenter: json["serviceCenter"],
        bookingDate: DateTime.parse(json["booking_date"]),
        total: json["total"],
        isPaid: json["is_paid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer": customer,
        "serviceCenter": serviceCenter,
        "booking_date": bookingDate.toIso8601String(),
        "total": total,
        "is_paid": isPaid,
      };
}
