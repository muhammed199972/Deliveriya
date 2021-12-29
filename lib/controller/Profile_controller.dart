import 'dart:developer';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/DeletePutPost.dart';
import 'package:delivery_food/model/Profile_model.dart';
import 'package:delivery_food/services/Profile_services.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profile = ProfileResponse().obs;
  ApiResult apiResult = ApiResult();
  ProfileService profileservice = ProfileService();
  var patch = DeletePutPostResponse().obs;
  var hasError = true.obs;
  var massage = ''.obs;
  var ispass1 = false.obs;
  var ispass2 = false.obs;
  var ispass3 = false.obs;
  var date = ''.obs;
  var gender = ''.obs;
  var phone = ''.obs;
  var firstnameController = TextEditingController();
  var genderController = TextEditingController();
  var datebirthController = TextEditingController();
  var phoneController = TextEditingController();
  StatusCode statusCode = StatusCode();

  @override
  void onInit() {
    if (statusCode.Token != '') getprofile();
    super.onInit();
  }

  var file = File('');
  var filenull = true.obs;
  Future postImg(x) async {
    final pickedFile = await ImagePicker.platform.getImage(source: x);
    if (pickedFile != null) {
      filenull.value = false;
      file = File(pickedFile.path);

      Get.back();
      update();
      return;
    } else {
      print('No image selected.');
    }
  }

  getprofile() async {
    try {
      BotToast.showLoading();

      apiResult = await profileservice.getprofilesData();
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          profile.value = apiResult.data;
          hasError.value = apiResult.hasError!;
          //
          firstnameController.text = profile.value.name;
          gender.value =
              profile.value.gender == null ? 'Male' : profile.value.gender!;
          genderController.text =
              profile.value.gender == null ? '' : profile.value.gender!;
          datebirthController.text = profile.value.date == null
              ? ''
              : profile.value.date!.substring(0, 10);
          phoneController.text = profile.value.phone!.toString();
          //
          //  log('${profile.value.name}', name: 'controller profile');
        } else {
          hasError.value = apiResult.hasError!;
          massage.value = apiResult.errorMassage!;
          DialogsUtils.showdialog(
              m: massage.value,
              onPressed: () {
                Get.back();
              });
        }
      } else {
        getprofile();
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
          });
    } finally {
      BotToast.closeAllLoading();
    }
  }

  patchprofile2() async {
    try {
      BotToast.showLoading();
      apiResult = await profileservice.patchprofileData2(
        name: firstnameController.text,
        gender: gender.value == '' ? profile.value.gender! : gender.value,
        birthdate: date.value == ''
            ? profile.value.date!.substring(0, 10)
            : date.value,
        file: file,
      );
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          patch.value = apiResult.data;
          await getprofile();
        } else {
          hasError.value = apiResult.hasError!;
          massage.value = apiResult.errorMassage!;
          DialogsUtils.showdialog(
              m: massage.value,
              onPressed: () {
                Get.back();
              });
        }
        Get.back();
      } else {
        patchprofile2();
      }
    } catch (e) {
      print(e);
    } finally {
      BotToast.closeAllLoading();
    }
  }
}
