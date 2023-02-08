import 'package:get/get.dart';

import '../farmer_complete_incident_controller.dart';

class FarmerCompleteIncidentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FarmerCompleteIncidentController>(
        FarmerCompleteIncidentController());
  }
}
