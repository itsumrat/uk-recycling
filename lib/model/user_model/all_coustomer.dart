// To parse this JSON data, do
//
//     final allCoustomerListModel = allCoustomerListModelFromJson(jsonString);

import 'dart:convert';

AllCoustomerListModel allCoustomerListModelFromJson(String str) => AllCoustomerListModel.fromJson(json.decode(str));

String allCoustomerListModelToJson(AllCoustomerListModel data) => json.encode(data.toJson());

class AllCoustomerListModel {
  final bool? success;
  final List<AllCustomerDatum>? data;
  final String? message;

  AllCoustomerListModel({
    this.success,
    this.data,
    this.message,
  });

  factory AllCoustomerListModel.fromJson(Map<String, dynamic> json) => AllCoustomerListModel(
    success: json["success"],
    data: json["data"] == null ? [] : List<AllCustomerDatum>.from(json["data"]!.map((x) => AllCustomerDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class AllCustomerDatum {
  final int? id;
  final String? customerId;
  final String? name;
  final String? email;
  final String? address;
  final String? createdAt;
  final String? updatedAt;

  AllCustomerDatum({
    this.id,
    this.customerId,
    this.name,
    this.email,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory AllCustomerDatum.fromJson(Map<String, dynamic> json) => AllCustomerDatum(
    id: json["id"],
    customerId: json["customer_id"],
    name: json["name"],
    email: json["email"],
    address: json["address"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "name": name,
    "email": email,
    "address": address,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
