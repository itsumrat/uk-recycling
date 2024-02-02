import 'dart:convert';

import 'package:crm/appConfig.dart';
import 'package:crm/model/user_model/all_coustomer.dart';
import 'package:crm/model/user_model/all_supplier_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model/allUserModel.dart';

class UserController{
  //get all user
  static Future<AllUserModel> getAllUser()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.ALL_USER),
      headers: {
        "Authorization" : "Bearer $token"
      }
    );
    return AllUserModel.fromJson(jsonDecode(res.body));
  }
  //get all user list
  static Future<AllUserModel> getAllUserList()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.ALL_USER_LIST),
      headers: {
        "Authorization" : "Bearer $token"
      }
    );
    return AllUserModel.fromJson(jsonDecode(res.body));
  }

  //get all supplier
  static Future<AllSupplierModel> getAllSupplier()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.ALL_SUPPLIER),
        headers: {
          "Authorization" : "Bearer $token"
        }
    );
    return AllSupplierModel.fromJson(jsonDecode(res.body));
  }

  //get all supplier
  static Future<AllCoustomerListModel> getAllCustomer()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.ALL_COUSTOMER),
        headers: {
          "Authorization" : "Bearer $token"
        }
    );
    return AllCoustomerListModel.fromJson(jsonDecode(res.body));
  }
}