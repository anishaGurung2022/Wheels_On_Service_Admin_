// To parse this JSON data, do
//
//     final customers = customersFromJson(jsonString);

import 'dart:convert';

Customers customersFromJson(String str) => Customers.fromJson(json.decode(str));

String customersToJson(Customers data) => json.encode(data.toJson());

class Customers {
  Customers({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
    required this.userName,
    required this.password,
    required this.isAdmin,
  });

  String id;
  String name;
  String phone;
  String address;
  String email;
  String userName;
  String password;
  String isAdmin;

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        email: json["email"],
        userName: json["userName"],
        password: json["password"],
        isAdmin: json["isAdmin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "address": address,
        "email": email,
        "userName": userName,
        "password": password,
        "isAdmin": isAdmin,
      };
}
