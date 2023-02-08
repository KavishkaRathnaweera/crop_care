import 'package:cropcare/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../models/incident.dart';
import '../services/database.dart';

class IncidentLogController extends GetxController {
  final RxBool noNewIncidents = false.obs;
  final RxList<IncidentModel> _newIncidents = <IncidentModel>[].obs;

  List<IncidentModel> get newIncidents => _newIncidents;

  @override
  void onInit() async {
    _newIncidents.bindStream(
        Database().userNewIncidents(Get.find<UserController>().user.id!));

    super.onInit();
  }
}
