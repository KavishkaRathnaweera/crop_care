import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';

class FarmerAccount extends GetWidget<UserController> {
  const FarmerAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/farmer-profile.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
          height: 200,
          width: double.infinity,
        ),
        Expanded(
            child: SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
              child: Card(
                shadowColor: const Color.fromARGB(255, 2, 105, 48),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Personal",
                            style: TextStyle(
                                color: Color.fromARGB(255, 2, 70, 2),
                                fontFamily: "AbhayaLibre",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              child: Text("Name:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "AbhayaLibre",
                                      fontSize: 18)),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    controller.user.name!,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              child: Text("Email:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "AbhayaLibre",
                                      fontSize: 18)),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    controller.user.email!,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              child: Text("Mobile number:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "AbhayaLibre",
                                      fontSize: 18)),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    controller.user.phone!,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              child: Text("NIC number:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "AbhayaLibre",
                                      fontSize: 18)),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    controller.user.nic!,
                                  )),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
              child: Card(
                shadowColor: const Color.fromARGB(255, 2, 105, 48),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Farm",
                            style: TextStyle(
                                color: Color.fromARGB(255, 2, 70, 2),
                                fontFamily: "AbhayaLibre",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              child: Text("Farm Name:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "AbhayaLibre",
                                      fontSize: 18)),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    controller.user.farm!.name!,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              child: Text("Address:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "AbhayaLibre",
                                      fontSize: 18)),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    controller.user.farm!.address!,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              child: Text("Registration number:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "AbhayaLibre",
                                      fontSize: 18)),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    controller.user.farm!.regNum!,
                                  )),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
              child: Card(
                shadowColor: const Color.fromARGB(255, 2, 105, 48),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Bank Account",
                            style: TextStyle(
                                color: Color.fromARGB(255, 2, 70, 2),
                                fontFamily: "AbhayaLibre",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              child: Text("Bank Name:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "AbhayaLibre",
                                      fontSize: 18)),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    controller.user.bank!.name!,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              child: Text("Account Number:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "AbhayaLibre",
                                      fontSize: 18)),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    controller.user.bank!.accountNum!,
                                  )),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ],
        )))
      ]),
    );
  }
}
