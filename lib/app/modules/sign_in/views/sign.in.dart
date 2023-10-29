import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recycle/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:recycle/app/routes/app_pages.dart';
import 'package:recycle/app/widgets/app.icon.button.filled.dart';
import 'package:recycle/app/widgets/app.text.form.field.dart';

class SignIn extends GetView<SignInController> {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 100,
              child: CircleAvatar(),
            ),
            const SizedBox(height: 100),
            AppTextFormField(
              controller: controller.emailController,
              label: "Email",
            ),
            const SizedBox(height: 20),
            AppTextFormField(
              controller: controller.passwordController,
              label: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.FORGOT_PASSWORD);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text("Forgot password?", textAlign: TextAlign.end),
              ),
            ),
            const SizedBox(height: 20),
            AppIconButton(
              onPressed: () {},
              title: "Log in",
            ),
          ],
        ),
      ),
    );
  }
}
