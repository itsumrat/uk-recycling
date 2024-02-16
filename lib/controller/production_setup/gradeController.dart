import 'dart:convert';

import 'package:crm/appConfig.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/delivery_model/grade_model/grade_model.dart';

class GradeController{

  //show grade list
  static Future<GradeModel> getGradeList()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.GRADE),
      headers: {
        "Authorization" : "Bearer $token",
      }
    );

    return GradeModel.fromJson(jsonDecode(res.body));
  }

  //create grade
  static Future<http.Response> createNewGrade({required String name})async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    var res = await http.post(Uri.parse(AppConfig.GRADE),
      body: {
        "name" : name
      },
        headers: {
          "Authorization" : "Bearer $token",
        }
    );
   return res;
  }


}