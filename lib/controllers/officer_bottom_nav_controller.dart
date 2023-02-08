import 'package:cropcare/screens/officer/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/officer/account.dart';
import '../screens/officer/complete_tasks.dart';
import '../screens/officer/inprogress_tasks.dart';

class OfficerBottomNavController extends GetxController {
  var currentIndex = 0.obs;

  final pages = <String>[
    'officerHome',
    'officerInprogressTasks',
    'officerCompleteTasks',
    'officerAccount'
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == 'officerHome') {
      return GetPageRoute(
          settings: settings,
          page: () => OfficerHome(),
          transition: Transition.noTransition);
    }

    if (settings.name == 'officerInprogressTasks') {
      return GetPageRoute(
          settings: settings,
          page: () => InprogressTasks(),
          transition: Transition.noTransition);
    }

    if (settings.name == 'officerCompleteTasks') {
      return GetPageRoute(
          settings: settings,
          page: () => CompleteTasks(),
          transition: Transition.noTransition);
    }

    if (settings.name == 'officerAccount') {
      return GetPageRoute(
          settings: settings,
          page: () => OfficerAccount(),
          transition: Transition.noTransition);
    }

    throw Exception();
  }
}
