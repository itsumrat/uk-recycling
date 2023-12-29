import 'dart:convert';

import 'package:crm/appConfig.dart';
import 'package:crm/controller/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/profile_model/profile_info_model.dart';

class ProfileController{

  //static profile info
  static Future<ProfileInfoModel> getProfileInfo()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var userId = _pref.getString("uid");

    print("user id === ${userId}");

    var res = await http.get(Uri.parse(AppConfig.PROFILE_INFO+userId!),
      headers: {
        "Authorization" : "Bearer $token"
      }
    );
    return ProfileInfoModel.fromJson(jsonDecode(res.body));
  }

}