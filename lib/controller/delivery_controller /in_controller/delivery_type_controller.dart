import 'dart:convert';

import 'package:crm/appConfig.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/delivery_model/in_model/delivery_model.dart';

class DeliveryTypeController{

  static Future<DeliveryTypeModel> getDeliveryType()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.GET_DELIVERY_TYPE),
      headers: {
        "Authorization" : "Bearer $token"
      }
    );
    return DeliveryTypeModel.fromJson(jsonDecode(res.body));
  }


  static Future<http.Response> addDeliveryType({required String name})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.post(Uri.parse(AppConfig.GET_DELIVERY_TYPE),
        headers: {
          "Authorization" : "Bearer $token"
        },
      body: {
        "name" : name
      }
    );

    return res;
  }
}