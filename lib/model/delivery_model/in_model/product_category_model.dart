// To parse this JSON data, do
//
//     final productCategoryMdel = productCategoryMdelFromJson(jsonString);

import 'dart:convert';

ProductCategoryMdel productCategoryMdelFromJson(String str) => ProductCategoryMdel.fromJson(json.decode(str));

String productCategoryMdelToJson(ProductCategoryMdel data) => json.encode(data.toJson());

class ProductCategoryMdel {
  final bool? success;
  final List<ProductCategoryDatum>? data;
  final String? message;

  ProductCategoryMdel({
    this.success,
    this.data,
    this.message,
  });

  factory ProductCategoryMdel.fromJson(Map<String, dynamic> json) => ProductCategoryMdel(
    success: json["success"],
    data: json["data"] == null ? [] : List<ProductCategoryDatum>.from(json["data"]!.map((x) => ProductCategoryDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class ProductCategoryDatum {
  final int? id;
  final String? categoryId;
  final String? name;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductCategoryDatum({
    this.id,
    this.categoryId,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductCategoryDatum.fromJson(Map<String, dynamic> json) => ProductCategoryDatum(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
