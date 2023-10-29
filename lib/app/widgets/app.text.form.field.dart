import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController? controller;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}
