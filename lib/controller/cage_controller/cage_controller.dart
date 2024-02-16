import 'dart:convert';

import 'package:crm/appConfig.dart';
import 'package:crm/model/cage_model/cage_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class CageController{
  //get all user
  static Future<CageListModel> getCageNo()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.ALL_CAGE),
        headers: {
          "Authorization" : "Bearer $token"
        }
    );
    return CageListModel.fromJson(jsonDecode(res.body));
  }

}