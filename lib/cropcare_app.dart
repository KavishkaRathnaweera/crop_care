
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import "package:flutter/material.dart";
import 'Screen/theme.dart';

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
      // initialBinding: AuthBinding(),
      theme: CropCareThemes.light,
      initialRoute: "/",
      // getPages: GetPages.init(),
      defaultTransition: Transition.zoom,
    );
  }
}
