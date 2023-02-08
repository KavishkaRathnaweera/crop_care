import 'package:cropcare/screens/auth/login_screen.dart';
import 'package:cropcare/screens/common/root_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';

class Root extends GetWidget<AuthController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return const RootHome();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
