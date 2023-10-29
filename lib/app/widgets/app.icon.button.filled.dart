import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Size? minimumSize;
  final IconData? icon;
  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.minimumSize,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize ?? const Size(double.infinity, 50),
        padding: const EdgeInsets.all(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            height: 50,
            width: double.infinity,
          ),
          Text(
            title,
          ),
          Positioned(
            right: 0,
            child: CircleAvatar(
              child: Icon(icon ?? Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
