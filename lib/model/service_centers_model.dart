// To parse this JSON data, do
//
//     final serviceCenters = serviceCentersFromJson(jsonString);

import 'dart:convert';

ServiceCenters serviceCentersFromJson(String str) =>
    ServiceCenters.fromJson(json.decode(str));

String serviceCentersToJson(ServiceCenters data) => json.encode(data.toJson());

class ServiceCenters {
  ServiceCenters({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
    required this.userName,
    required this.image,
    required this.cities,
  });

  String id;
  String name;
  String phone;
  String address;
  String email;
  String userName;
  String image;
  String cities;

  factory ServiceCenters.fromJson(Map<String, dynamic> json) => ServiceCenters(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        email: json["email"],
        userName: json["userName"],
        image: json["image"],
        cities: json["cities"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "address": address,
        "email": email,
        "userName": userName,
        "image": image,
        "cities": cities,
      };
}
