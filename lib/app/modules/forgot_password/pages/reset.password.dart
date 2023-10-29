import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recycle/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:recycle/app/widgets/app.icon.button.filled.dart';
import 'package:recycle/app/widgets/app.text.form.field.dart';

class ResetPassword extends GetWidget<ForgotPasswordController> {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        const Text(
          "Please enter your new password. Make sure it's at least 8 characters long.",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        AppTextFormField(
            label: "New Password", controller: controller.passwordController),
        const SizedBox(height: 20),
        AppTextFormField(
          label: "Confirm Password",
          controller: controller.confirmPasswordController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter the password";
            }
            if (value != controller.passwordController.text) {
              return "Password does not match";
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        AppIconButton(
          onPressed: () {
            controller.pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          title: "Continue",
        ),
      ],
    );
  }
}
