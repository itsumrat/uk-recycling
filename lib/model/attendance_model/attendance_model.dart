// To parse this JSON data, do
//
//     final allAttendanceListModel = allAttendanceListModelFromJson(jsonString);

import 'dart:convert';

AllAttendanceListModel allAttendanceListModelFromJson(String str) => AllAttendanceListModel.fromJson(json.decode(str));

String allAttendanceListModelToJson(AllAttendanceListModel data) => json.encode(data.toJson());

class AllAttendanceListModel {
  final bool? success;
  final List<Datum>? data;
  final String? message;

  AllAttendanceListModel({
    this.success,
    this.data,
    this.message,
  });

  factory AllAttendanceListModel.fromJson(Map<String, dynamic> json) => AllAttendanceListModel(
        success: json["success"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  final int? id;
  final DateTime? date;
  final int? userId;
  final String? checkIn;
  final String? checkOut;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final User? user;

  Datum({
    this.id,
    this.date,
    this.userId,
    this.checkIn,
    this.checkOut,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        userId: json["user_id"],
        checkIn: json["check_in"],
        checkOut: json["check_out"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date?.toIso8601String(),
        "user_id": userId,
        "check_in": checkIn,
        "check_out": checkOut,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

class User {
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

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"]!,
        email: json["email"]!,
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
