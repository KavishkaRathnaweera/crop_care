import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 182, 85),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/splash.gif', fit: BoxFit.cover),
              AnimatedTextKit(animatedTexts: [
                TyperAnimatedText('Cropify',
                    textStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                        fontSize: 50,
                        fontFamily: "Lobster",
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Color.fromARGB(255, 2, 70, 2)),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Color.fromARGB(255, 2, 70, 2)),
                          Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Color.fromARGB(255, 2, 70, 2)),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Color.fromARGB(255, 2, 70, 2)),
                        ]),
                    speed: const Duration(milliseconds: 300))
              ]),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
