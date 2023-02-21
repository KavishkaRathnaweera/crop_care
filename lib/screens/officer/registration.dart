import 'dart:io';

import 'package:cropcare/controllers/auth_controller.dart';
import 'package:cropcare/screens/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cropcare/screens/officer/appbar.dart';
import 'package:image_picker/image_picker.dart';

class OfficerRegistration extends StatelessWidget {
  OfficerRegistration({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nicController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  File? userImageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OfficerAppBar(),
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Complete Profile",
              style: CropCareThemes.titleTextTheme,
            ),
            const SizedBox(
              height: 25,
            ),
            ImageProfile(context),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 10.0),
              child: Card(
                shadowColor: const Color.fromARGB(255, 6, 118, 182),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "User Credentials",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 20, 9, 119),
                                fontFamily: "AbhayaLibre"),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(hintText: "Email"),
                          controller: emailController,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Password"),
                          controller: passwordController,
                          obscureText: true,
                        ),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 10.0),
              child: Card(
                shadowColor: const Color.fromARGB(255, 6, 118, 182),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Personal Details",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 20, 9, 119),
                                fontFamily: "AbhayaLibre"),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(hintText: "Name"),
                          controller: nameController,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Mobile Number"),
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "NIC Number"),
                          controller: nicController,
                        ),
                      ]),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text("Submit"),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 2, 3, 70)),
              onPressed: () {
                if (GetUtils.isPhoneNumber(phoneController.text)) {
                  authController.createOfficer(
                      emailController.text,
                      passwordController.text,
                      nameController.text,
                      nicController.text,
                      phoneController.text);
                } else {
                  Get.snackbar(
                      "Incorrect Format", "Please enter a valid phone number",
                      snackPosition: SnackPosition.BOTTOM,
                      snackStyle: SnackStyle.FLOATING);
                }

                if (authController.isLoading.value) {
                  Get.dialog(const Center(child: CircularProgressIndicator()),
                      barrierDismissible: false);
                }
              },
            )
          ],
        )),
      ),
    );
  }

  Widget ImageProfile(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Obx(() => CircleAvatar(
                radius: 80,
                backgroundColor: const Color.fromARGB(255, 181, 182, 204),
                backgroundImage: authController.isProfilePathSet.value == true
                    ? FileImage(File(authController.profilePath.value))
                        as ImageProvider
                    : const AssetImage("assets/profile2.png"),
              )),
          Positioned(
            child: InkWell(
              onTap: () {
                Get.bottomSheet(Container(
                  height: 120.0,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 181, 182, 204),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 50,
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Choose Profile Photo",
                            style: TextStyle(
                              fontSize: 20.0,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 10),
                            TextButton.icon(
                                onPressed: () => takePhoto(ImageSource.camera),
                                icon: const Icon(Icons.camera),
                                label: const Text("Camera")),
                            const SizedBox(width: 50),
                            TextButton.icon(
                                onPressed: () => takePhoto(ImageSource.gallery),
                                icon: const Icon(Icons.image),
                                label: const Text("Gallery"))
                          ],
                        )
                      ],
                    ),
                  ),
                ));
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(125, 125, 0, 0),
                child: const Icon(
                  Icons.camera_alt,
                  color: Color.fromARGB(255, 20, 9, 119),
                  size: 28.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    if (pickedFile != null) {
      userImageFile = File(pickedFile.path);
      authController.setProfileImagePath(pickedFile.path);

      Get.back();
    }
  }
}
