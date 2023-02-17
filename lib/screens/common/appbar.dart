import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class CropCareAppBar extends GetWidget<AuthController>
    implements PreferredSizeWidget {
  final bool visible;

  const CropCareAppBar({Key? key, this.visible = true}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            'CropCare',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w100,
                fontSize: 25,
                fontFamily: "Lobster",
                ),
          ),
        ),
        backgroundColor: const Color.fromARGB(214, 254,194,1),
        actions: visible
            ? [
                PopupMenuButton(
                    icon: const Icon(Icons.menu,color: Colors.black,),
                    color: Colors.white,
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              child: TextButton(
                                  child: const Text(
                                    "Log Out",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 80, 79, 79)),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    controller.signOut();
                                  })),
                        ])
              ]
            : []);
  }
}
