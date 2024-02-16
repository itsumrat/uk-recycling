import 'package:flutter/material.dart';

class AppSideBySIdeText extends StatelessWidget {
  const AppSideBySIdeText({
    super.key, required this.leftText, required this.rightText,
  });

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$leftText ",
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 15
            ),
          ),
          const SizedBox(width: 20,),
          Flexible(
            child: Text(rightText,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  fontSize: 18
              ),
            ),
          )
        ],
      ),
    );
  }
}
