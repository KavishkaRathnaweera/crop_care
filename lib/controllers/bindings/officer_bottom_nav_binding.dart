import 'package:get/get.dart';
import '../officer_bottom_nav_controller.dart';

class OfficerBottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => OfficerBottomNavController());
  }
}
