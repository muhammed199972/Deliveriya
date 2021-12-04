import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/model/Auth_model.dart';
import 'package:delivery_food/services/Auth_service.dart';
import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var auth = AuthResponse().obs;
  var signUpResponse = SignUpResponse().obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  AuthService authservice = AuthService();
  var sendcode = false.obs;
  Constans Constansbox = Constans();

  @override
  void onInit() {
    super.onInit();
  }

  getcode(String phone) async {
    try {
      apiResult = await authservice.getauthCode(phone);
      if (!apiResult.hasError!) {
        auth.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        sendcode.value = true;
        print(auth.value.code);
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
      }
    } finally {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
    }
  }

  postcodeNumber(String phone, String code) async {
    try {
      BotToast.showLoading();
      apiResult = await authservice.postcode(phone, code);
      if (!apiResult.hasError!) {
        signUpResponse.value = apiResult.data;
        Constansbox.box
            .write('accessToken', signUpResponse.value.data!.accessToken);
        Constansbox.box
            .write('refreshToken', signUpResponse.value.data!.refreshToken);
        hasError.value = apiResult.hasError!;
        Get.offAll(HomeView());
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
        BotToast.showText(
          text: 'Error!',
          align: Alignment.center,
        );
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      print(e);
    } finally {
      BotToast.closeAllLoading();
    }
  }

  postrefreshToken() async {
    try {
      BotToast.showLoading();
      apiResult = await authservice.postrefreshToken();
      if (!apiResult.hasError!) {
        signUpResponse.value = apiResult.data;
        Constansbox.box
            .write('accessToken', signUpResponse.value.data!.accessToken);
        Constansbox.box
            .write('refreshToken', signUpResponse.value.data!.refreshToken);
        hasError.value = apiResult.hasError!;
        Get.offAll(HomeView());
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
        BotToast.showText(
          text: 'Error!',
          align: Alignment.center,
        );
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      print(e);
    } finally {
      BotToast.closeAllLoading();
    }
  }
}
