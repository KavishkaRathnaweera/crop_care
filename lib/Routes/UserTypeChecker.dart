
import 'package:cropcare/Services/DataBaseService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Controllers/AuthenticationController.dart';
import '../Controllers/UserController.dart';
import '../Screen/AppScreen/Loading.dart';
import '../Screen/Farmer/FarmerRoot.dart';


class UserTypeChecker extends GetWidget<AuthController> {
  const UserTypeChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      initState: (_) async {
        Get.find<UserController>().user =
        await DatabaseService().getUser(Get.find<AuthController>().user!.uid);
      },
      builder: (_) {
        if (_.user.email != null) {
          if (_.user.role == "farmer") {
            return FarmerHomeRoot();
          } else {
            //return OfficerHomeRoot();
            return FarmerHomeRoot();
          }
        } else {
          return const Loading();
        }
      },
    );
  }
}