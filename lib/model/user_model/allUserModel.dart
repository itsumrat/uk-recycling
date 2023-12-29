// To parse this JSON data, do
//
//     final allUserModel = allUserModelFromJson(jsonString);

import 'dart:convert';

AllUserModel allUserModelFromJson(String str) => AllUserModel.fromJson(json.decode(str));

String allUserModelToJson(AllUserModel data) => json.encode(data.toJson());

class AllUserModel {
  final bool? success;
  final List<UserDatum>? data;
  final String? message;

  AllUserModel({
    this.success,
    this.data,
    this.message,
  });

  factory AllUserModel.fromJson(Map<String, dynamic> json) => AllUserModel(
    success: json["success"],
    data: json["data"] == null ? [] : List<UserDatum>.from(json["data"]!.map((x) => UserDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class UserDatum {
  final int? id;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final String? userId;
  final String? address;
  final String? userType;
  final String? passkey;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserDatum({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.userId,
    this.address,
    this.userType,
    this.passkey,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDatum.fromJson(Map<String, dynamic> json) => UserDatum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    userId: json["user_id"],
    address: json["address"],
    userType: json["user_type"],
    passkey: json["passkey"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "user_id": userId,
    "address": address,
    "user_type": userType,
    "passkey": passkey,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
