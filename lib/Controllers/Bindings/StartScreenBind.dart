import 'package:cropcare/Controllers/StartingScreenController.dart';
import 'package:get/get.dart';

class StartingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StartingScreenController());
  }
}