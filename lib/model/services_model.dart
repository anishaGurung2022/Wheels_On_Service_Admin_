// To parse this JSON data, do
//
//     final services = servicesFromJson(jsonString);

import 'dart:convert';

Services servicesFromJson(String str) => Services.fromJson(json.decode(str));

String servicesToJson(Services data) => json.encode(data.toJson());

class Services {
  Services({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.serviceCenter,
    required this.image,
  });

  String id;
  String name;
  String description;
  String price;
  String category;
  String serviceCenter;
  String image;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        category: json["category"],
        serviceCenter: json["serviceCenter"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "category": category,
        "serviceCenter": serviceCenter,
        "image": image,
      };
}
