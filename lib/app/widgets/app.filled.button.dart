import 'package:flutter/material.dart';

class AppFilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Size? minimumSize;
  const AppFilledButton({
    super.key,
    required this.onPressed,
    this.minimumSize,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: minimumSize,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
