import 'dart:convert';

import 'package:crm/appConfig.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/delivery_model/in_model/product_category_model.dart';

class DeliveryInProductCategoryController{
  static Future<ProductCategoryMdel>? getProductCategory()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.GET_PRODUCT_CATEGORY),
      headers: {
        "Authorization" : "Bearer $token"
      }
    );
    return ProductCategoryMdel.fromJson(jsonDecode(res.body));
  }

  static Future<http.Response> addProductCategory({required String name})async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    var res = await http.post(Uri.parse(AppConfig.GET_PRODUCT_CATEGORY),
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