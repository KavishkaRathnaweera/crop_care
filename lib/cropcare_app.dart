
import 'package:cropcare/Routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import "package:flutter/material.dart";
import 'Controllers/Bindings/auth_binding.dart';
import 'theme.dart';

class CropCareApp extends StatelessWidget {
  // const CropCare({Key? key}) : super(key: key) ;
  CropCareApp({super.key}) {
    // PushNotificationService().initialise();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "CropCare",
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      theme: CropCareThemes.light,
      initialRoute: "/",
      getPages: AppRouter.init(),
      defaultTransition: Transition.zoom,
    );
  }
}
