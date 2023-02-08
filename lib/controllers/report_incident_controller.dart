import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropcare/models/incident.dart';
import 'package:cropcare/models/incident_status.dart';
import 'package:cropcare/utils/connectivity.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../models/media.dart';
import '../models/user.dart';
import '../services/database.dart';

class ReportIncidentController extends GetxController {
  final List<String> _cropTypeList = <String>[].obs;
  List<String> _selectedCropTypes = [];

  List<String>? get crops => _cropTypeList;

  set selectedCropTypes(List<String> value) => _selectedCropTypes = value;
  List<String> get selectedCrops => _selectedCropTypes;

  final isLoading = false.obs;

  @override
  onInit() {
    cropTypes();
    super.onInit();
  }

  void cropTypes() async {
    _cropTypeList.assignAll(await Database().getCropTypes());
  }

  void reportIncident(UserModel user, List<String> cropTypes, double acres,
      String description, List<Media> media) async {
    isLoading.value = true;

    // check internet connectivity
    bool hasConnectivity = await Connectivity().hasConnection();
    if (hasConnectivity) {
      UserAvatar _userAvatar = UserAvatar(
          userId: user.id,
          name: user.name,
          address: user.farm!.address,
          bankName: user.bank!.name,
          accountNum: user.bank!.accountNum,
          fcmToken: user.fcmToken);

      // upload media to firebase storage
      List<MediaDTO> mediaDTOs = [];
      try {
        for (Media mediaObj in media) {
          File file = File(mediaObj.file.path);
          final fileName = basename(file.path);
          final destination = 'incident-media/$fileName';

          final Reference storageReference =
              FirebaseStorage.instance.ref().child(destination);
          UploadTask uploadTask = storageReference.putFile(file);

          String fileUrl = await (await uploadTask).ref.getDownloadURL();

          String thumbnailUrl = '';
          if (mediaObj.thumbnail != null) {
            final thumbnailName = basename(mediaObj.thumbnail!.path);
            final thumbnailDestination = 'incident-media/$thumbnailName';

            final Reference storageReference =
                FirebaseStorage.instance.ref().child(thumbnailDestination);
            UploadTask uploadTask =
                storageReference.putFile(mediaObj.thumbnail!);

            thumbnailUrl = await (await uploadTask).ref.getDownloadURL();
          }

          mediaDTOs.add(MediaDTO(
              mediaRef: fileUrl, type: mediaObj.type, thumbnail: thumbnailUrl));
        }
      } catch (e) {
        Get.snackbar(
          "Sorry",
          "Error uploading media",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

      try {
        IncidentModel _incident = IncidentModel(
            types: cropTypes.join(', '),
            description: description.trim(),
            media: mediaDTOs,
            acres: acres,
            date: Timestamp.fromDate(DateTime.now()),
            status: IncidentStatus.NEW,
            user: _userAvatar,
            reviewDate: null,
            rejectDate: null,
            completeDate: null,
            amount: null,
            comment: null);

        if (await Database().createIncident(_incident)) {
          isLoading.value = false;
          _selectedCropTypes.clear();
          Get.back(closeOverlays: true);
          Get.snackbar("Success", "Your incident has been reported",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green);
        }
      } catch (_) {
        isLoading.value = false;
        Get.snackbar("Sorry", "Something went wrong",
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      }
    } else {
      isLoading.value = false;
      Get.back();
      Get.snackbar(
          "You are not connected", "Please check your internet connection",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}
