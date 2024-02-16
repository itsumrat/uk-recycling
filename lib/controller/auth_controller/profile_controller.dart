import 'dart:convert';

import 'package:crm/appConfig.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/profile_model/profile_info_model.dart';

class ProfileController{

  //static profile info
  static Future<ProfileInfoModel> getProfileInfo()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    var userId = pref.getString("uid");

    print("user id === $userId");

    var res = await http.get(Uri.parse(AppConfig.PROFILE_INFO+userId!),
      headers: {
        "Authorization" : "Bearer $token"
      }
    );
    return ProfileInfoModel.fromJson(jsonDecode(res.body));
  }

}