import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbar {
  Snackbar.showSuccess(String message) {
    _showSnackbar(message, Color.fromARGB(255, 3, 99, 6));
  }

  Snackbar.showError(String message) {
    _showSnackbar(message, Color.fromARGB(255, 185, 21, 21));
  }

  void _showSnackbar(String message, Color bgColor) {
    Get.snackbar('', '',
        margin: const EdgeInsets.symmetric(horizontal: 10),
        borderRadius: 4,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: bgColor,
        titleText: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 4));
  }
}
