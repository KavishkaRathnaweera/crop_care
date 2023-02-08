import 'package:cropcare/cropify_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } on FirebaseException catch (e) {
    if (kDebugMode) {
      print('Error in initializing Firebase: $e');
    }
  }
  runApp(CropifyApp());
}
