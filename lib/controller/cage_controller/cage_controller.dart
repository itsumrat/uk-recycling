import 'dart:convert';

import 'package:crm/appConfig.dart';
import 'package:crm/model/cage_model/cage_model.dart';
import 'package:crm/model/user_model/all_coustomer.dart';
import 'package:crm/model/user_model/all_supplier_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model/allUserModel.dart';

class CageController{
  //get all user
  static Future<CageListModel> getCageNo()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.ALL_CAGE),
        headers: {
          "Authorization" : "Bearer $token"
        }
    );
    return CageListModel.fromJson(jsonDecode(res.body));
  }

}