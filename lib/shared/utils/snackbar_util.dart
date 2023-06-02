import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackbarEnum { alert, error, info }

class SnackbarUtil {
  static void showSnackbar(SnackbarEnum type, String title, String message,
      {Duration? duration}) {
    var backgroundColor = const Color.fromARGB(255, 136, 103, 28);
    var icon = Icons.warning_amber;

    if (type == SnackbarEnum.error) {
      backgroundColor = Colors.red;
      icon = Icons.error;
    } else if (type == SnackbarEnum.info) {
      backgroundColor = Colors.blue;
      icon = Icons.info;
    }

    Get.snackbar(title, message,
        backgroundColor: backgroundColor,
        colorText: Colors.white,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        duration: duration);
  }
}
