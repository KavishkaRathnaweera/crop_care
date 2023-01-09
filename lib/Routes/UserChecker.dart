

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Controllers/AuthenticationController.dart';
import '../Controllers/UserController.dart';
import '../Screen/Authentication/LoginScreen.dart';
import 'UserTypeChecker.dart';


class UserChecker extends GetWidget<AuthController> {
  const UserChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return const UserTypeChecker();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
