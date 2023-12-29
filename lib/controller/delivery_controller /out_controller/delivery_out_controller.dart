import 'dart:convert';

import 'package:crm/appConfig.dart';
import 'package:crm/model/delivery_model/out_model/SingleExistingDeliveryOutModel.dart';
import 'package:crm/model/delivery_model/out_model/deliveryOutTsListModel.dart';
import 'package:crm/model/delivery_model/out_model/existing_delivery_out_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/delivery_model/out_model/single_delveryout_trx_momdel.dart';

class DeliveryOutController{

  static Future<http.Response> addNewDeliveryOut({required String category_id, required String customer_id, required String measurement_type, required String delivery_type })async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var userId = _pref.getString("uid");
    print("user id == ${userId}");
    var res = await http.post(Uri.parse(AppConfig.DELIVERY_OUT_CREATE),
        body: {
          "category_id" : category_id,
          "customer_id" : customer_id,
          "measurement_type" : measurement_type,
          "delivery_type" : delivery_type
        },
      headers: {
        "Authorization" : "Bearer $token"
      }
    );
    return res;
  }


  //get exsiting delivdy out
    static Future<ExistingDeliveryOutListModel> getExistingDelidyOutList()async{
      SharedPreferences _pref = await SharedPreferences.getInstance();
      var token = _pref.getString("token");
      var res = await http.get(Uri.parse(AppConfig.DELIVERY_OUT_CREATE),
          headers: {
            "Authorization" : "Bearer $token"
          }
      );
      return ExistingDeliveryOutListModel.fromJson(jsonDecode(res.body));
    }


  //get single delivery in
  static Future<SingleExistingDeliveryOutModel> getSingleDeliveryOut({required String id})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.DELIVERY_OUT_CREATE+"/$id"),
        headers: {
          "Authorization" : "Bearer $token"
        }
    );
    print(res.statusCode);
    print(res.body);
    return SingleExistingDeliveryOutModel.fromJson(jsonDecode(res.body));
  }

  //get single delivery in
  static Future<DeliveryOutTrListModel> getSingleDeliveryOutTrList({required String id})async{
    print("delivery id === ${id}");
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.TRANSCATION_BY_DELIVERYOUT+"$id"),
        headers: {
          "Authorization" : "Bearer $token"
        }
    );
    print(res.statusCode);
    print(res.body);
    return DeliveryOutTrListModel.fromJson(jsonDecode(res.body));
  }

  //get single delivery in
  static Future<SingleDeliveryOutTrxModel> getSingleDeliveryOutTrx({required String id})async{
    print("delivery id === ${id}");
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.DELIVERY_OUT_TR+"/$id"),
        headers: {
          "Authorization" : "Bearer $token"
        }
    );
    print(res.statusCode);
    print(res.body);
    return SingleDeliveryOutTrxModel.fromJson(jsonDecode(res.body));
  }

  //Single existing model
  static Future<http.Response> addTranscations({ required String deliveryTypeId, required String cageNo, required String measurementId, required String weight})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    print("delivery id == $deliveryTypeId");

    var withoutCageNoData = {
      "weight" : weight,
      "delivery_id" :deliveryTypeId,
      "measurement" :measurementId,
    };
    var withCageNoData = {
      "weight" : weight,
      "delivery_id" :deliveryTypeId,
      "measurement" :measurementId,
      "cage_no" : cageNo
    };
    var res = await http.post(Uri.parse(AppConfig.DELIVERY_OUT_TR),
        headers: {
          "Authorization" : "Bearer $token"
        },
        body: cageNo != "null" ? withCageNoData : withoutCageNoData
    );
    print(res.statusCode);
    print(res.body);
    return res;
  }


  //edit
  static Future<http.Response> editTranscations({ required String weight, required String case_no, required String id})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    var withoutCaseNo = {
      "weight" : weight
    };
    var withCaseNo = {
      "weight" : weight,
      "case_no" : case_no
    };

    print("cage not == $case_no");
    print("cage not == $weight");
    print("cage not == $id");
    var res = await http.put(Uri.parse(AppConfig.DELIVERY_OUT_TR+"/$id"),
        headers: {
          "Authorization" : "Bearer $token"
        },
        body: case_no != "null" ? withCaseNo : withoutCaseNo
    );
    print("res.statusCode ${res.statusCode}");
    print("res.body ${res.body}");
    return res;
  }


  //delete

  //delivery in delete
  static Future<http.Response> deleteDeliveryOut({required String id})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = await _pref.getString("token");
    var res = await http.delete(Uri.parse(AppConfig.DELIVERY_OUT_CREATE+"/$id"),
      headers: {
        "Authorization" : "Bearer $token"
      },
    );
    return res;
  }

}