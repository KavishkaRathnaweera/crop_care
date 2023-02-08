import 'package:cropcare/controllers/officer_bottom_nav_controller.dart';
import 'package:cropcare/screens/officer/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfficerHomeRoot extends GetView<OfficerBottomNavController> {
  OfficerHomeRoot({Key? key}) : super(key: key);

  final OfficerBottomNavController officerBottomNavController =
      Get.put(OfficerBottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const OfficerAppBar(),
        body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: 'officerHome',
          onGenerateRoute: controller.onGenerateRoute,
        ),
        bottomNavigationBar: Obx(
          (() => BottomNavigationBar(
                elevation: 10,
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_active),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.timelapse),
                    label: 'In-Progress',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle),
                    label: 'Complete',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Account',
                  ),
                ],
                currentIndex: controller.currentIndex.value,
                selectedItemColor: Colors.pink,
                onTap: controller.changePage,
              )),
        ));
  }
}
