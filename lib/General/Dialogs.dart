import 'package:delivery_food/General/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogsUtils {
  /// Show related to storage service dialogs
  static showdialog({String? m, Function()? onPressed}) {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
        title: Text(
          'error',
          textAlign: TextAlign.center,
        ),
        content: Text(
          m!,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              "OK",
              style: TextStyle(color: AppColors.mainColor),
            ),
            onPressed: onPressed,
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  static showdialogConfirm(
      {String? m, Function()? onPressedOk, Function()? onPressedCancel}) {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
        title: Text(
          'error',
          textAlign: TextAlign.center,
        ),
        content: Text(
          m!,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              "OK",
              style: TextStyle(color: AppColors.mainColor),
            ),
            onPressed: onPressedOk,
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            child: Text(
              "Cancel",
              style: TextStyle(color: AppColors.mainColor),
            ),
            onPressed: onPressedCancel,
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
