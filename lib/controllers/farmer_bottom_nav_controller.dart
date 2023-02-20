import 'package:cropcare/controllers/bindings/farmer_complete_incident_binding.dart';
import 'package:cropcare/controllers/bindings/incident_log_binding.dart';
import 'package:cropcare/screens/farmer/news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/farmer/account.dart';
import '../screens/farmer/complete_incident.dart';
import '../screens/farmer/home.dart';
import '../screens/farmer/incident_log.dart';

class FarmerBottomNavController extends GetxController {
  var currentIndex = 2.obs;

  final pages = <String>[
    'farmerIncidentLog',
    'farmerCompleteIncident',
    'farmerHome',
    'news',
    'farmerAccount'
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == 'farmerHome') {
      return GetPageRoute(
          settings: settings,
          page: () => const FarmerHome(),
          transition: Transition.noTransition);
    }

    if (settings.name == 'farmerIncidentLog') {
      return GetPageRoute(
          settings: settings,
          page: () =>  IncidentLog(),
          binding: IncidentLogBinding(),
          transition: Transition.noTransition);
    }

    if (settings.name == 'farmerCompleteIncident') {
      return GetPageRoute(
          settings: settings,
          page: () => const CompleteIncident(),
          binding: FarmerCompleteIncidentBinding(),
          transition: Transition.noTransition);
    }

    if (settings.name == 'farmerAccount') {
      return GetPageRoute(
          settings: settings,
          page: () => const FarmerAccount(),
          transition: Transition.noTransition);
    }

    if (settings.name == 'news') {
      return GetPageRoute(
          settings: settings,
          page: () => const News(),
          transition: Transition.noTransition);
    }

    throw Exception();
  }
}
