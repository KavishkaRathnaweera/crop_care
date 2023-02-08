import 'package:cropcare/models/incident.dart';
import 'package:cropcare/models/incident_status.dart';
import 'package:cropcare/widgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';

import '../services/database.dart';

class IncidentController extends GetxController {
  final RxList<IncidentModel> _incidentList = <IncidentModel>[].obs;

  List<IncidentModel> get incidents => _incidentList;

  @override
  void onInit() async {
    _incidentList.bindStream(Database().incidentStream());
    super.onInit();
  }

  void setStatus(String id, IncidentStatus value, String comment, num amount,
      {String? to}) async {
    try {
      await Database().setIncidentStatus(id, value, comment, amount);
      Snackbar.showSuccess("Moved to ${value.name} state");
      Get.offAllNamed("/OfficerHomeRoot");
    } catch (e) {
      Snackbar.showError(e.toString());
    }
  }

  void startPaymentOption(String id, String name, String accountNum,
      String bankName, String comment, num amount, String address, String to) {
    Map paymentObject = {
      "sandbox": true,
      "merchant_id": "1220017",
      "notify_url": "https://ent13zfovoz7d.x.pipedream.net/",
      "order_id": id,
      "items": "Hello from Flutter!",
      "amount": amount,
      "recurrence": "1 Month",
      "duration": "1 Year",
      "currency": "LKR",
      "first_name": name,
      "last_name": "",
      "email": "",
      "phone": "",
      "address": address,
      "city": "",
      "country": "Sri Lanka",
      "delivery_address": "",
      "delivery_city": "",
      "delivery_country": "",
      "custom_1": accountNum,
      "custom_2": bankName
    };
    PayHere.startPayment(paymentObject, (paymentId) {
      setStatus(id, IncidentStatus.COMPLETED, comment, amount, to: to);
      print("One Time Payment Success. Payment Id: $paymentId");
    }, (error) {
      Snackbar.showError(error);
      print("One Time Payment Failed. Error: $error");
    }, () {
      Snackbar.showError("One Time Payment Dismissed");
      print("One Time Payment Dismissed");
    });
  }
}
