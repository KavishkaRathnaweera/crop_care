import 'package:cropcare/routes/routes.dart';
import 'package:cropcare/screens/common/theme.dart';
import 'package:cropcare/services/push_notification_service.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'controllers/bindings/auth_binding.dart';

class CropCareApp extends StatelessWidget {
  CropCareApp() {
    PushNotificationService().initialise();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "CropCare",
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      theme: CropCareThemes.light,
      initialRoute: "/",
      getPages: GetPages.init(),
      defaultTransition: Transition.zoom,
    );
  }
}
