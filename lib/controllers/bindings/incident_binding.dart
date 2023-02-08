import 'package:cropcare/controllers/incident_controller.dart';
import 'package:get/get.dart';

class IncidentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IncidentController());
  }
}
