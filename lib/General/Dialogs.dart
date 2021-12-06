import 'package:delivery_food/General/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogsUtils {
  /// Show related to storage service dialogs
  static showGuestLogInDialog(String m) {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
        title: Text(
          "تسجيل الدخول مطلوب",
          textAlign: TextAlign.center,
        ),
        content: Text(
          m,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              "OK",
              style: TextStyle(color: AppColors.mainColor),
            ),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
