import 'package:flutter/material.dart';
import 'package:flutter_getx/global/values/values.dart';
import 'package:get/route_manager.dart';

class Notifier {
  static snackbar(String title, String message, [bool isError = true]) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.PRIMARY_COLOR,
      animationDuration: Duration(milliseconds: 200),
      barBlur: 0.0,
      borderRadius: 0.0,
      colorText: AppColors.WHITE_COLOR,
      margin: EdgeInsets.zero,
      icon: Icon(
        isError ? Icons.error : Icons.done,
        color: AppColors.TEAL_COLOR,
      ),
    );
  }
}
