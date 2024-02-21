// To parse this JSON data, do
//
//     final cageListModel = cageListModelFromJson(jsonString);

import 'dart:convert';

CageListModel cageListModelFromJson(String str) => CageListModel.fromJson(json.decode(str));

String cageListModelToJson(CageListModel data) => json.encode(data.toJson());

class CageListModel {
  final bool? success;
  final List<CageDatum>? data;
  final String? message;

  CageListModel({
    this.success,
    this.data,
    this.message,
  });

  factory CageListModel.fromJson(Map<String, dynamic> json) => CageListModel(
        success: json["success"],
        data: json["data"] == null ? [] : List<CageDatum>.from(json["data"]!.map((x) => CageDatum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class CageDatum {
  final int? id;
  final String? caseName;
  final double? weight;
  final double? productWeight;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CageDatum({
    this.id,
    this.caseName,
    this.weight,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.productWeight,
  });

  factory CageDatum.fromJson(Map<String, dynamic> json) => CageDatum(
        id: json["id"],
        caseName: json["case_name"],
        weight: json["weight"]?.toDouble(),
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        productWeight: json["product_weight"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "case_name": caseName,
        "weight": weight,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product_weight": productWeight,
      };
}
