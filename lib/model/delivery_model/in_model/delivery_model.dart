// To parse this JSON data, do
//
//     final deliveryTypeModel = deliveryTypeModelFromJson(jsonString);

import 'dart:convert';

DeliveryTypeModel deliveryTypeModelFromJson(String str) => DeliveryTypeModel.fromJson(json.decode(str));

String deliveryTypeModelToJson(DeliveryTypeModel data) => json.encode(data.toJson());

class DeliveryTypeModel {
  final bool? success;
  final List<DeliveryDatum>? data;
  final String? message;

  DeliveryTypeModel({
    this.success,
    this.data,
    this.message,
  });

  factory DeliveryTypeModel.fromJson(Map<String, dynamic> json) => DeliveryTypeModel(
    success: json["success"],
    data: json["data"] == null ? [] : List<DeliveryDatum>.from(json["data"]!.map((x) => DeliveryDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class DeliveryDatum {
  final int? id;
  final String? deliveryTypeId;
  final String? name;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DeliveryDatum({
    this.id,
    this.deliveryTypeId,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory DeliveryDatum.fromJson(Map<String, dynamic> json) => DeliveryDatum(
    id: json["id"],
    deliveryTypeId: json["delivery_type_id"],
    name: json["name"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "delivery_type_id": deliveryTypeId,
    "name": name,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
