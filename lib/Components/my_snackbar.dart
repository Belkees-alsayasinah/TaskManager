import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackbar({
  required String title,
  required String message,
  required Icon icon,
  SnackPosition position = SnackPosition.TOP,
  Duration duration = const Duration(seconds: 5),
}) {
  Get.snackbar(
    title,
    message,
    icon: icon,
    duration: duration,
    snackPosition: position,
  );
}
