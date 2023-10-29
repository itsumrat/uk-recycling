import 'package:get/get.dart';
import 'package:recycle/app/modules/sign_in/views/sign.in.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/user.type.selector.page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.USER_TYPE_SELECTOR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignIn(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.USER_TYPE_SELECTOR,
      page: () => const UserTypeSelector(),
      binding: SignInBinding(),
    ),

  ];
}
