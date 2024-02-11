import 'dart:convert';

import 'package:crm/appConfig.dart';
import 'package:crm/model/delivery_model/in_model/single_deliveryin_model.dart';
import 'package:crm/model/delivery_model/in_model/single_deliveryin_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/delivery_model/in_model/deliveryin_model.dart';

class DeliveryInController {
  //existing model
  static Future<ExsitingDeliveryinModel> getExstingDeliveryIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    var res = await http.get(Uri.parse(AppConfig.DELIVERY_ID), headers: {"Authorization": "Bearer $token"});
    print(res.statusCode);
    print(res.body);
    return ExsitingDeliveryinModel.fromJson(jsonDecode(res.body));
  }

  //get single delivery in
  static Future<SingleDeliveryInModel> getSingleDeliveryIn({required String id}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    var res = await http.get(Uri.parse("${AppConfig.DELIVERY_ID}/$id"), headers: {"Authorization": "Bearer $token"});
    return SingleDeliveryInModel.fromJson(jsonDecode(res.body));
  }

  //Single existing model
  static Future<TranscaByDeliveryInIdModel> getSingleExistingDeliveryInTransactions({required String id}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    var res = await http
        .get(Uri.parse("${AppConfig.TRANSCATION_BY_DELIVERYID}$id"), headers: {"Authorization": "Bearer $token"});
    print(res.statusCode);
    print("res.body ${res.body}");
    return TranscaByDeliveryInIdModel.fromJson(jsonDecode(res.body));
  }

  //Single existing model
  static Future<http.Response> editTranscations(
      {required String weight, required String case_no, required String id}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    var withoutCaseNo = {"weight": weight};
    var withCaseNo = {"weight": weight, "case_no": case_no};
    var res = await http.put(Uri.parse("${AppConfig.DELIVERY_IN_TRANSCATION}/$id"),
        headers: {"Authorization": "Bearer $token"}, body: case_no != null ? withCaseNo : withoutCaseNo);
    print(res.statusCode);
    print(res.body);
    return res;
  }

  //Single existing model
  static Future<http.Response> addTranscations(
      {required String deliveryTypeId,
      required String cageNo,
      required String measurementId,
      required String weight}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    print("delivery id == $deliveryTypeId");
    var withoutCageNoData = {
      "weight": weight,
      "delivery_id": deliveryTypeId,
      "measurement": measurementId,
    };
    var withCageNoData = {
      "weight": weight,
      "delivery_id": deliveryTypeId,
      "measurement": measurementId,
      "cage_no": cageNo
    };
    var res = await http.post(Uri.parse(AppConfig.DELIVERY_IN_TRANSCATION),
        headers: {"Authorization": "Bearer $token"}, body: cageNo != "null" ? withCageNoData : withoutCageNoData);
    print(res.statusCode);
    print(res.body);
    return res;
  }

  //delivery in delete
  static Future<http.Response> deleteDeliveryIn({required String id}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    var res = await http.delete(
      Uri.parse("${AppConfig.DELIVERY_ID}/$id"),
      headers: {"Authorization": "Bearer $token"},
    );
    print("res---- ${res.statusCode}");
    debugPrint("res---- ${res.body}");

    return res;
  }
}
