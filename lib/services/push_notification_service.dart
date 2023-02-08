import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialise() async {
    String? token = await _fcm.getToken();
    print("Token body" + token!);

    FirebaseMessaging.onMessage.listen((event) {
      print("message recieved");
      print(event.notification!.body);

      Get.defaultDialog(
          title: "Notification",
          content: Text(event.notification!.body!),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("OK"))
          ]);
    });

    FirebaseMessaging.onMessage.listen((event) {
      print("Message Open");
    });
  }

  Future<void> _messageHandler(RemoteMessage message) async {
    print('background message ${message.notification!.body}');
  }

  Future<String?> getFcmToken() {
    return _fcm.getToken();
  }
}
