import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum UserType {
  user,
  supervisor,
  attendance;

  @override
  String toString() {
    return switch (this) {
      UserType.user => 'User',
      UserType.supervisor => 'Supervisor',
      UserType.attendance => 'Attendance',
    };
  }
}

class SignInController extends GetxController {
  Rxn<UserType> userType = Rxn<UserType>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void updateUserType(UserType userType) {
    this.userType.value = userType;
  }
}
