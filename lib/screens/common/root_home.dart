import 'package:cropcare/screens/common/loading.dart';
import 'package:cropcare/screens/farmer/home_root.dart';
import 'package:cropcare/screens/farmer/registration.dart';
import 'package:cropcare/screens/officer/home_root.dart';
import 'package:cropcare/screens/officer/registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../controllers/user_controller.dart';
import '../../../services/database.dart';

class RootHome extends GetWidget<AuthController> {
  const RootHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      initState: (_) async {
        Get.find<UserController>().user =
            await Database().getUser(Get.find<AuthController>().user!.uid);
      },
      builder: (_) {
        if (_.user.email != null) {
          if (_.user.name != null) {
            if (_.user.role == "FARMER") {
              return FarmerHomeRoot();
            } else {
              return OfficerHomeRoot();
            }
          } else {
            if (_.user.role == "FARMER") {
              return FarmerRegistration();
            } else {
              return OfficerRegistration();
            }
          }
        } else {
          return const Loading();
        }
      },
    );
  }
}
