import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recycle/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:recycle/app/widgets/app.icon.button.filled.dart';

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
            AppIconButton(
              onPressed: () {},
              title: "Log in  ",
            ),
          ],
        ),
      ),
    );
  }
}
