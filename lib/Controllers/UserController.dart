import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

import '../Models/Bank.dart';
import '../Models/Farm.dart';
import '../Models/Registered_farm.dart';
import '../Models/User.dart';
import '../Screen/Widgets/SnackBar.dart';
import '../Services/DataBaseService.dart';

class UserController extends GetxController {
  final Rx<UserModel> _userModel =
      UserModel().obs; // listen to changes to userModel

  final Rx<RegisteredFarmModel> _registeredFarm = RegisteredFarmModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => _userModel.value = value;

  var isProfilePathSet = false.obs;
  var profilePath = ''.obs;

  final isLoading = false.obs;

  void setProfileImagePath(String path) {
    profilePath.value = path;
    isProfilePathSet.value = true;
  }

  void clear() {
    _userModel.value = UserModel();
  }

  void registerUser(String userName, String phone, String nic, String bankName,
      String accountNum, String farmName, String address, String regNum) async {
    isLoading.value = true;
    try {
      Bank _bank =
      Bank(name: bankName.trim(), accountNum: accountNum.trim());
      user.name = userName.trim();
      user.nic = nic.trim();
      user.phone = phone;
      user.bank = _bank;
      user.farm = regNum;

      if (await DatabaseService().registerUser(user, _registeredFarm.value.id!)) {
        isLoading.value = false;
        Get.offAllNamed('/root');
      }
    } on FirebaseException catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error registering account",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Future<bool> isFarmRegistered(String regNum) async {
  //   try {
  //     List<RegisteredFarmModel> registered =
  //     await DatabaseService().isFarmRegistered(regNum);
  //     if (registered.isEmpty) {
  //       Get.snackbar("Error registering account",
  //           "Provided farm registration number is not government registered",
  //           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
  //     } else {
  //       _registeredFarm.value = registered[0];
  //       if (_registeredFarm.value.registered!) {
  //         Get.snackbar(
  //             "Error registering account", "Farm is already registered",
  //             snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
  //       } else {
  //         return true;
  //       }
  //     }
  //   } on FirebaseException catch (e) {
  //     Get.snackbar(
  //       "Error creating Account",
  //       e.message.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   } catch (e) {
  //     isLoading.value = false;
  //     Get.snackbar(
  //       "Error creating Account",
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  //   return false;
  // }

  void updateOfficer(String userName, String phone, String nic) async {
    isLoading.value = true;
    try {
      //upload profile picture to firebase storage
      String? url;
      if (isProfilePathSet.value == true) {
        String filename = basename(profilePath.value);
        File imageFile = File(profilePath.value);

        final Reference storageReference =
        FirebaseStorage.instance.ref().child("profiles/$filename");
        UploadTask uploadTask = storageReference.putFile(imageFile);

        url = await (await uploadTask).ref.getDownloadURL();
      } else {
        url = "https://urlty.co/Zcs";
      }

      user.name = userName.trim();
      user.phone = phone;
      user.nic = nic.trim();

      if (await DatabaseService().updateOfficer(user)) {
        isLoading.value = false;
        Snackbar.showSuccess("Succefully updated the profile");
        Get.offAllNamed("/OfficerHomeRoot");
      }
    } catch (e) {
      isLoading.value = false;
      Snackbar.showError("Error updating profile");
    }
  }
}
