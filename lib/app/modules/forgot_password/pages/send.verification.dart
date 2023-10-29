import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recycle/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:recycle/app/widgets/app.icon.button.filled.dart';
import 'package:recycle/app/widgets/app.text.form.field.dart';

class SendVerification extends GetWidget<ForgotPasswordController> {
  const SendVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 100,
          child: CircleAvatar(),
        ),
        const SizedBox(height: 100),
        const Text(
          "Please enter your email address. We will send you a code to reset your password.",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        const AppTextFormField(
          label: "Email",
          suffixIcon: Icons.email_outlined,
        ),
        const SizedBox(height: 20),
        AppIconButton(
          onPressed: () {
            controller.pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          title: "Send",
        ),
      ],
    );
  }
}
