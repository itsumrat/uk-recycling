import 'dart:convert';

import 'package:crm/appConfig.dart';
import 'package:crm/view/auth/signin.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AuthController{

  //==== get api contrller
  static Future<http.Response> login({required String email, required String password})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(AppConfig.LOGIN),
      body: {
        "email": email,
        "password" : password
      }
    );
    print("rest === ${response.body}");
    print("rest === ${response.statusCode}");
    if(response.statusCode == 200){
      _pref.setString("token", jsonDecode(response.body)["token"]).toString();
      _pref.setString("user_id", jsonDecode(response.body)["user_id"].toString());
      _pref.setString("uid", jsonDecode(response.body)["uid"].toString());
      _pref.setString("user_name", jsonDecode(response.body)["name"].toString());
      _pref.setString("role", jsonDecode(response.body)["type"].toString());
    }
    return response;
  }


  //===== logout delete all data from shared pre
  static Future logout()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.remove("token");
    _pref.remove("role");
    _pref.remove("user_name");
    _pref.remove("uid");
    _pref.remove("user_id");
    Get.offAll(SignIn());
  }




}