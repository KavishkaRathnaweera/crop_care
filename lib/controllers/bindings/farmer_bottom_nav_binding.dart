import 'package:get/get.dart';
import '../farmer_bottom_nav_controller.dart';

class FarmerBottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => FarmerBottomNavController());
  }
}
