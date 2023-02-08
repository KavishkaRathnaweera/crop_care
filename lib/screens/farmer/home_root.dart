import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/farmer_bottom_nav_controller.dart';
import '../common/appbar.dart';

class FarmerHomeRoot extends GetView<FarmerBottomNavController> {
  FarmerHomeRoot({Key? key}) : super(key: key);

  final FarmerBottomNavController bottomNavController =
      Get.put(FarmerBottomNavController());
  // TODO: delete bottom nav controller on sign out

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CropifyAppBar(),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: 'farmerHome',
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Log',
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
    );
  }
}
