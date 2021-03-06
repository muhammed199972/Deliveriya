import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Address_controller.dart';
import 'package:delivery_food/view/Profile_page/AddAddress.dart';
import 'package:delivery_food/view/Profile_page/Component/AddressWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

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

  static showdialogHelp({String? m, Function()? onPressed}) {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
        title: Text(
          'Help',
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

  static showdialogVirefy(
      {String? m, Function()? onPressedOk, Function()? onPressedCancel}) {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
        title: Text(
          'Virefication',
          textAlign: TextAlign.center,
        ),
        content: Text(
          m!,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          OTPTextField(
            width: double.infinity,
            length: 6,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.underline,
            outlineBorderRadius: 4,
            fieldWidth: 40,
            style: TextStyle(color: Colors.black),
            otpFieldStyle: OtpFieldStyle(
              backgroundColor: Colors.grey.shade50,
              disabledBorderColor: Colors.black,
              enabledBorderColor: AppColors.mainColor,
            ),
            onChanged: (k) {},
            onCompleted: (n) {
              // controller.postcodeNumber(
              //   _phoneController.text,
              //   n,
              // );
            },
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  static showdialogdelete(
      {String? m, Function()? onPressedOk, Function()? onPressedCancel}) {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
        title: Text(
          'Delete',
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
              style: TextStyle(color: Colors.white),
            ),
            onPressed: onPressedCancel,
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  static showdialogAddress() {
    var controller = Get.find<AddressController>();

    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Stack(
            children: [
              Obx(
                () => ListView.builder(
                  itemCount: controller.address.length,
                  itemBuilder: (context, int index) => InkWell(
                    child: AddressWidget(
                      icon: SvgPicture.asset('assets/svg/address.svg'),
                      txt:
                          '${controller.address[index].town!.city!.name}-${controller.address[index].town!.name}',
                      subtitle:
                          '${controller.address[index].locationDescription ?? ''}',
                    ),
                    onTap: () {
                      controller.data.value = controller.address[index];
                      Get.back();
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: FloatingActionButton(
                  backgroundColor: AppColors.mainColor,
                  child: SvgPicture.asset(
                    'assets/svg/plus.svg',
                    color: AppColors.whiteColor,
                  ),
                  onPressed: () {
                    Get.to(() => AddAddress());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
