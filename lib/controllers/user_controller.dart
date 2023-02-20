import 'dart:io';

import 'package:cropcare/models/registered_farm.dart';
import 'package:cropcare/widgets/snackbar.dart';
import 'package:cropcare/models/bank.dart';
import 'package:cropcare/models/farm.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/database.dart';

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

      BankModel _bank =
          BankModel(name: bankName.trim(), accountNum: accountNum.trim());
      FarmModel _farm = FarmModel(
          name: farmName.trim(),
          address: address.trim(),
          regNum: regNum.trim());
      user.name = userName.trim();
      user.nic = nic.trim();
      user.phone = phone;
      user.bank = _bank;
      user.farm = _farm;

      if (await Database().registerUser(user, _registeredFarm.value.id!)) {
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

  Future<bool> isFarmRegistered(String regNum) async {
    try {
      List<RegisteredFarmModel> registered =
          await Database().isFarmRegistered(regNum);
      if (registered.isEmpty) {
        Get.snackbar("Error registering account",
            "Provided farm registration number is not government registered",
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      } else {
        _registeredFarm.value = registered[0];
        if (_registeredFarm.value.registered!) {
          Get.snackbar(
              "Error registering account", "Farm is already registered",
              snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
        } else {
          return true;
        }
      }
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error creating Account",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }

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
      user.profilePicRef = url;

      if (await Database().updateOfficer(user)) {
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
