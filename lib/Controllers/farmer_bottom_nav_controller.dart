
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screen/Farmer/FarmerHome.dart';


class FarmerBottomNavController extends GetxController {
  var currentIndex = 0.obs;

  final pages = <String>[
    'farmerHome',
    'farmerIncidentLog',
    'farmerCompleteIncident',
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

    // if (settings.name == 'farmerIncidentLog') {
    //   return GetPageRoute(
    //       settings: settings,
    //       page: () => const IncidentLog(),
    //       binding: IncidentLogBinding(),
    //       transition: Transition.noTransition);
    // }
    //
    // if (settings.name == 'farmerCompleteIncident') {
    //   return GetPageRoute(
    //       settings: settings,
    //       page: () => const CompleteIncident(),
    //       binding: FarmerCompleteIncidentBinding(),
    //       transition: Transition.noTransition);
    // }
    //
    // if (settings.name == 'farmerAccount') {
    //   return GetPageRoute(
    //       settings: settings,
    //       page: () => const FarmerAccount(),
    //       transition: Transition.noTransition);
    // }

    throw Exception();
  }
}
