import 'package:cropcare/screens/common/appbar.dart';
import 'package:cropcare/screens/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';

class FarmerRegistration extends GetWidget<UserController> {
  FarmerRegistration({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nicController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumController = TextEditingController();
  final TextEditingController farmNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController regNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CropCareAppBar(),
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Complete Profile",
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 70, 2),
                    fontFamily: "AbhayaLibre",
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
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
                            alignment: Alignment.topRight,
                            child: Text(
                              "Personal Details",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 70, 2),
                                  fontFamily: "AbhayaLibre"),
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(hintText: "Name"),
                            controller: nameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Mobile Number"),
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Mobile number is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: "NIC Number"),
                            controller: nicController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "NIC number is required";
                              } else {
                                return null;
                              }
                            },
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
                            alignment: Alignment.topRight,
                            child: Text(
                              "Farm Details",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 70, 2),
                                  fontFamily: "AbhayaLibre"),
                            ),
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: "Farm Name"),
                            controller: farmNameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Farm name is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: "Address"),
                            controller: addressController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Address is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Registration Number"),
                            controller: regNumController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Registration number is required";
                              } else {
                                return null;
                              }
                            },
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
                            alignment: Alignment.topRight,
                            child: Text(
                              "Bank Details",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 70, 2),
                                  fontFamily: "AbhayaLibre"),
                            ),
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: "Bank Name"),
                            controller: bankNameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bank name is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Account Number"),
                            controller: accountNumController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Account number is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text("Register"),
                onPressed: () async {
                  if (nameController.value.text.isEmpty ||
                      phoneController.value.text.isEmpty ||
                      nicController.value.text.isEmpty ||
                      bankNameController.value.text.isEmpty ||
                      accountNumController.value.text.isEmpty ||
                      farmNameController.value.text.isEmpty ||
                      addressController.value.text.isEmpty ||
                      regNumController.value.text.isEmpty) {
                    Get.snackbar("Invalid", "Please fill all fields",
                        snackPosition: SnackPosition.BOTTOM,
                        snackStyle: SnackStyle.FLOATING,
                        backgroundColor: Colors.red);
                  } else if (!GetUtils.isPhoneNumber(phoneController.text)) {
                    Get.snackbar(
                        "Incorrect Format", "Please enter a valid phone number",
                        snackPosition: SnackPosition.BOTTOM,
                        snackStyle: SnackStyle.FLOATING,
                        backgroundColor: Colors.red);
                  } else {
                    if (await controller
                        .isFarmRegistered(regNumController.text)) {
                      controller.registerUser(
                        nameController.text,
                        phoneController.text,
                        nicController.text,
                        bankNameController.text,
                        accountNumController.text,
                        farmNameController.text,
                        addressController.text,
                        regNumController.text,
                      );
                    }

                    if (controller.isLoading.value) {
                      const Loading();
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
