// To parse this JSON data, do
//
//     final allSupplierModel = allSupplierModelFromJson(jsonString);

import 'dart:convert';

AllSupplierModel allSupplierModelFromJson(String str) => AllSupplierModel.fromJson(json.decode(str));

String allSupplierModelToJson(AllSupplierModel data) => json.encode(data.toJson());

class AllSupplierModel {
  final bool? success;
  final List<SupplierDatum>? data;
  final String? message;

  AllSupplierModel({
    this.success,
    this.data,
    this.message,
  });

  factory AllSupplierModel.fromJson(Map<String, dynamic> json) => AllSupplierModel(
    success: json["success"],
    data: json["data"] == null ? [] : List<SupplierDatum>.from(json["data"]!.map((x) => SupplierDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class SupplierDatum {
  final int? id;
  final String? supplierId;
  final String? name;
  final String? email;
  final String? address;
  final String? createdAt;
  final String? updatedAt;

  SupplierDatum({
    this.id,
    this.supplierId,
    this.name,
    this.email,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory SupplierDatum.fromJson(Map<String, dynamic> json) => SupplierDatum(
    id: json["id"],
    supplierId: json["supplier_id"],
    name: json["name"],
    email: json["email"],
    address: json["address"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "supplier_id": supplierId,
    "name": name,
    "email": email,
    "address": address,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
