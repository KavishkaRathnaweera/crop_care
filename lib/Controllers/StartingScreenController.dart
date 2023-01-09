import 'dart:async';
import 'package:get/get.dart';

class StartingScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    Timer(const Duration(seconds: 3), () {
      Get.offAndToNamed("/root");
    });
  }
}