import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class LoginScreen extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/vegies.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            height: 250,
            width: double.infinity,
            child: const Text(
              'Cropify',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w100,
                  fontSize: 70,
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
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(hintText: "Email"),
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Password",
                        ),
                        controller: passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        child: const Text("Log In"),
                        onPressed: () {
                          controller.login(
                              emailController.text, passwordController.text);
                        },
                      ),
                      TextButton(
                        child: const Text(
                          "Sign Up",
                          style:
                              TextStyle(color: Color.fromARGB(255, 2, 70, 2)),
                        ),
                        onPressed: () {
                          Get.toNamed('/signup-screen');
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
