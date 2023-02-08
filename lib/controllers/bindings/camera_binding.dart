import 'package:get/get.dart';

import '../media_picker_controller.dart';

class CameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CameraController());
  }
}
