import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:recycle/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:recycle/app/widgets/app.icon.button.filled.dart';

class EnterPincode extends GetWidget<ForgotPasswordController> {
  const EnterPincode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        const Text(
          "Please enter the code we sent to your email address.",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: PinCodeTextField(
            appContext: context,
            length: 4,
            onChanged: (value) {},
            onCompleted: (value) {},
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),
            ),
            autoFocus: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter the code";
              }
              return null;
            },
            controller: controller.pincodeController,
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {
            controller.pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          child: const Text("Resend Code"),
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
