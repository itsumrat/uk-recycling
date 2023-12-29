import 'package:flutter/material.dart';

class AppSnackbar{


  static appSnackbar(text, bg, context, {time = 3000})async{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: bg,
      duration: Duration(milliseconds: time),
    ));
  }

}