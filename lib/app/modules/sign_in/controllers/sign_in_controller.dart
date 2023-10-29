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


  void updateUserType(UserType userType){
    this.userType.value = userType;
  }
}
