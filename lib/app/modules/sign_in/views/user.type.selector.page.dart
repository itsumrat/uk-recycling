import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recycle/app/routes/app_pages.dart';
import 'package:recycle/app/widgets/app.filled.button.dart';

import '../controllers/sign_in_controller.dart';

class UserTypeSelector extends GetView<SignInController> {
  const UserTypeSelector({Key? key}) : super(key: key);
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
            AppFilledButton(
              onPressed: () {
                controller.updateUserType(UserType.supervisor);
                Get.toNamed(Routes.SIGN_IN);
              },
              title: "Supervisor",
              minimumSize: const Size(double.infinity, 100),
            ),
            const SizedBox(
              height: 20,
            ),
            AppFilledButton(
              onPressed: () {
                controller.updateUserType(UserType.user);
                Get.toNamed(Routes.SIGN_IN);
              },
              title: "User",
              minimumSize: const Size(double.infinity, 100),
            ),
            const SizedBox(
              height: 20,
            ),
            AppFilledButton(
              onPressed: () {
                controller.updateUserType(UserType.attendance);
                Get.toNamed(Routes.SIGN_IN);
              },
              title: "Attendance",
              minimumSize: const Size(double.infinity, 100),
            ),
          ],
        ),
      ),
    );
  }
}
