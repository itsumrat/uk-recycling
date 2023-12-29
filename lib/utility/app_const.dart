import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppConst{

  static const String adminRole = "Admin";
  static const String attendantRole = "Attendant";
  static const String supervisorRole = "Supervisor";
  static const String staffRole = "Staff";

  static  DateFormat inputFormat =  DateFormat("dd-MM-yyyy");
  static  DateFormat serverFormat =  DateFormat("yyyy-MM-dd");

  static String currentData(){
    var date = DateTime.now();
    return inputFormat.format(date);
  }


  static String formetData(date){
    return inputFormat.format(DateTime.parse("$date"));
  }
  static String serverDateFormat(date){
    return serverFormat.format(DateTime.parse("$date"));
  }


  static Future<String> selectTime({required BuildContext context}) async {
    TimeOfDay selectedTime = TimeOfDay.now();

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      print("Selected time: ${picked.format(context)}");
    }

    return picked!.format(context);
  }


}