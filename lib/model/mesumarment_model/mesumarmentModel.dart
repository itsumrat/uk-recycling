// To parse this JSON data, do
//
//     final allMeasurementsListModel = allMeasurementsListModelFromJson(jsonString);

import 'dart:convert';

AllMeasurementsListModel allMeasurementsListModelFromJson(String str) => AllMeasurementsListModel.fromJson(json.decode(str));

String allMeasurementsListModelToJson(AllMeasurementsListModel data) => json.encode(data.toJson());

class AllMeasurementsListModel {
  final bool? success;
  final List<MeasurmentDatum>? data;
  final String? message;

  AllMeasurementsListModel({
    this.success,
    this.data,
    this.message,
  });

  factory AllMeasurementsListModel.fromJson(Map<String, dynamic> json) => AllMeasurementsListModel(
    success: json["success"],
    data: json["data"] == null ? [] : List<MeasurmentDatum>.from(json["data"]!.map((x) => MeasurmentDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class MeasurmentDatum {
  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MeasurmentDatum({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory MeasurmentDatum.fromJson(Map<String, dynamic> json) => MeasurmentDatum(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
