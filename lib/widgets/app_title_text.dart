import 'package:flutter/material.dart';


class AppTitleText extends StatelessWidget {
  const AppTitleText({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text("$text",
      style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 20
      ),
    );
  }
}
