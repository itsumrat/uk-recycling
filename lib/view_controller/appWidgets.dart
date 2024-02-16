import 'package:flutter/material.dart';

class AppWidgets{


  static   LinearGradient buildLinearGradient({
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight
  }) {
    return  LinearGradient(
      colors: const [
        Color(0xFF41C5D8),
        Color(0xFF3366FF),
      ],
      // begin: const FractionalOffset(0.0, 0.0),
      // end: const FractionalOffset(1.0, 0.0),
      begin: begin,
      end: end,
      stops: const [0.0, 1.0],
      tileMode: TileMode.clamp,
    );
  }


  static   LinearGradient buildRedLinearGradient({
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight
  }) {
    return  LinearGradient(
      colors: const [
        Color(0xFFFF776B),
        Color(0xFF790B00),
      ],
      // begin: const FractionalOffset(0.0, 0.0),
      // end: const FractionalOffset(1.0, 0.0),
      begin: begin,
      end: end,
      stops: const [0.0, 1.0],
      tileMode: TileMode.clamp,
    );
  }

}