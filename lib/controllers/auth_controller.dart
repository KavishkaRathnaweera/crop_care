import 'dart:io';

import 'package:cropcare/services/push_notification_service.dart';
import 'package:cropcare/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cropcare/controllers/user_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../models/user.dart';
import '../services/database.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _firebaseUser = Rxn<User>();

  RxBool isProfilePathSet = false.obs;
  RxString profilePath = ''.obs;

  RxBool isLoading = false.obs;
  bool showPassword = false;

  User? get user => _firebaseUser.value;

  @override
  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void setShowPassword() {
    showPassword = !showPassword;
  }

  void setProfileImagePath(String path) {
    profilePath.value = path;
    isProfilePathSet.value = true;
  }

  void createUser(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      String? fcmToken = await PushNotificationService().getFcmToken();
      print(_authResult.user);
      //create user in database
      UserModel _user = UserModel(
          id: _authResult.user?.uid,
          name: null,
          phone: null,
          email: _authResult.user?.email,
          nic: null,
          role: "FARMER",
          profilePicRef: null,
          bank: null,
          farm: null,
          fcmToken: fcmToken);
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.back(closeOverlays: true);
      }
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createOfficer(String email, String password, String name, String nic,
      String phone) async {
    isLoading.value = true;

    String? fcmToken = await PushNotificationService().getFcmToken();
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

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
        url = "gs://cropcare-app.appspot.com/profile_pic/gff.jpg";
      }

      //create user in database
      UserModel _user = UserModel(
          id: _authResult.user?.uid,
          name: name.trim(),
          phone: phone,
          email: _authResult.user?.email,
          nic: nic,
          role: "OFFICER",
          profilePicRef: url,
          bank: null,
          farm: null,
          fcmToken: fcmToken);
      if (await Database().createNewUser(_user)) {
        isLoading.value = false;
        Get.find<UserController>().user =
            await Database().getUser(_authResult.user?.uid);
        Get.offAllNamed("/root");
      }
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      isLoading.value = false;
      Snackbar.showError(e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user?.uid);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    isLoading.value = true;
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
