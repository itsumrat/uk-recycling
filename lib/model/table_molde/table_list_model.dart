// To parse this JSON data, do
//
//     final tableListModel = tableListModelFromJson(jsonString);

import 'dart:convert';

TableListModel tableListModelFromJson(String str) => TableListModel.fromJson(json.decode(str));

String tableListModelToJson(TableListModel data) => json.encode(data.toJson());

class TableListModel {
  final bool? success;
  final List<TableDatum>? data;
  final String? message;

  TableListModel({
    this.success,
    this.data,
    this.message,
  });

  factory TableListModel.fromJson(Map<String, dynamic> json) => TableListModel(
    success: json["success"],
    data: json["data"] == null ? [] : List<TableDatum>.from(json["data"]!.map((x) => TableDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class TableDatum {
  final int? id;
  final String? tableId;
  final String? name;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TableDatum({
    this.id,
    this.tableId,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory TableDatum.fromJson(Map<String, dynamic> json) => TableDatum(
    id: json["id"],
    tableId: json["table_id"],
    name: json["name"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "table_id": tableId,
    "name": name,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
