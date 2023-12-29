import 'package:crm/view_controller/appWidgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBox extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final VoidCallback onClick;
  const AppBox({
    super.key, required this.title,  this.height = 220,  this.width = double.infinity, required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: AppWidgets.buildLinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.shirt,
              size: 45,
              color: Colors.white,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
