import 'dart:convert';

import 'package:crm/appConfig.dart';
import 'package:crm/model/attendance_model/attendance_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendnaceController{

  //Clockin
  static Future<http.Response> clockIn({
  required String date, required String time, required String userId, required String passKey,
  })async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.post(Uri.parse(AppConfig.CLOCK_IN),
      headers: {
        "Authorization" : "Bearer $token"
      },
      body: {
        "check_in" : time,
        "passkey" : "$passKey",
        "user_id" : "$userId",
        "date" : date
      }
    );
    return res;
  }


  //Clockin
  static Future<http.Response> clockOut({
    required String date, required String time, required String userId, required String passKey,
  })async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.post(Uri.parse(AppConfig.CLOCK_OUT),
        headers: {
          "Authorization" : "Bearer $token"
        },
        body: {
          "check_out" : time,
          "passkey" : passKey,
          "user_id" : userId,
          "date" : date
        }
    );
    return res;
  }


  //static get all attandence list
  static Future<AllAttendanceListModel> getAllAttandenceList()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.ATTENDANCE_LIST),
        headers: {
          "Authorization" : "Bearer $token"
        }
    );

    return AllAttendanceListModel.fromJson(jsonDecode(res.body));
  }
}