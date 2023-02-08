import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class OfficerAppBar extends GetWidget<AuthController>
    implements PreferredSizeWidget {
  final bool visible;

  const OfficerAppBar({Key? key, this.visible = true}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            'Cropify',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 25,
                fontFamily: "Lobster",
                shadows: [
                  Shadow(
                      // bottomLeft
                      offset: Offset(-1.5, -1.5),
                      color: Color.fromARGB(255, 75, 53, 45)),
                  Shadow(
                      // bottomRight
                      offset: Offset(1.5, -1.5),
                      color: Color.fromARGB(255, 75, 53, 45)),
                  Shadow(
                      // topRight
                      offset: Offset(1.5, 1.5),
                      color: Color.fromARGB(255, 75, 53, 45)),
                  Shadow(
                      // topLeft
                      offset: Offset(-1.5, 1.5),
                      color: Color.fromARGB(255, 75, 53, 45)),
                ]),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 9, 119),
        actions: visible
            ? [
                PopupMenuButton(
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              child: TextButton(
                                  child: const Text(
                                    "Sign Out",
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
