import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recycle/app/modules/forgot_password/pages/enter.pincode.dart';
import 'package:recycle/app/modules/forgot_password/pages/reset.password.dart';
import 'package:recycle/app/modules/forgot_password/pages/send.verification.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PageView(
          controller: controller.pageController,
          children: const [
            SendVerification(),
            EnterPincode(),
            ResetPassword(),
          ],
        ),
      ),
    );
  }
}
