import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/Auth_model.dart';
import 'package:delivery_food/services/Auth_service.dart';
import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:delivery_food/view/Virefy_pages/Signup_Page/Sign_up_page.dart';
import 'package:delivery_food/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var auth = AuthResponse().obs;
  var signUpResponse = SignUpResponse().obs;
  var hasError = true.obs;
  var massage = ''.obs;
  var sendcode = false.obs;
  var authType = ''.obs;
  var ispass = false.obs;
  ApiResult apiResult = ApiResult();
  AuthService authservice = AuthService();
  Constans Constansbox = Constans();
  StatusCode statusCode = StatusCode();
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
        code = auth.value.code!;
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
        DialogsUtils.showdialog(
            m: massage.value,
            onPressed: () {
              Get.back();
            });
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
          });
    }
  }

  postsignup(String password) async {
    try {
      BotToast.showLoading();
      apiResult = await authservice.postsignup(password);
      if (!apiResult.hasError!) {
        signUpResponse.value = apiResult.data;
        await Constansbox.box
            .write('accessToken', signUpResponse.value.data!.accessToken);
        await Constansbox.box
            .write('refreshToken', signUpResponse.value.data!.refreshToken);
        hasError.value = apiResult.hasError!;
        if (statusCode.favorite.isNotEmpty) postfavorateData();
        if (statusCode.cartsid.isNotEmpty) postcartData();
        Get.offAll(
          BottomBar(
            fu: HomeView(),
          ),
        );
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
        BotToast.showText(
          text: apiResult.errorMassage!,
          align: Alignment.center,
        );
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      print(e);
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
          });
    } finally {
      BotToast.closeAllLoading();
    }
  }

  postsignin(String num, String password) async {
    try {
      BotToast.showLoading();
      apiResult = await authservice.postsignin(num, password);
      if (!apiResult.hasError!) {
        signUpResponse.value = apiResult.data;
        await Constansbox.box
            .write('accessToken', signUpResponse.value.data!.accessToken);
        await Constansbox.box
            .write('refreshToken', signUpResponse.value.data!.refreshToken);
        hasError.value = apiResult.hasError!;
        // List y=[];
        // y.isNotEmpty
        if (statusCode.favorite.isNotEmpty) postfavorateData();
        if (statusCode.cartsid.isNotEmpty) postcartData();
        Get.offAll(
          BottomBar(
            fu: HomeView(),
          ),
        );
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
        BotToast.showText(
          text: apiResult.errorMassage!,
          align: Alignment.center,
        );
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      print(e);
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
          });
    } finally {
      BotToast.closeAllLoading();
    }
  }

  postrefreshToken() async {
    try {
      apiResult = await authservice.postrefreshToken();
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          signUpResponse.value = apiResult.data;
          Constansbox.box
              .write('accessToken', signUpResponse.value.data!.accessToken);
          Constansbox.box
              .write('refreshToken', signUpResponse.value.data!.refreshToken);
          hasError.value = apiResult.hasError!;
        } else {
          hasError.value = apiResult.hasError!;
          massage.value = apiResult.errorMassage!;
          BotToast.showText(
            text: 'Error!',
            align: Alignment.center,
          );
        }
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      print(e);
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
          });
    } finally {}
  }

  postcartData() async {
    try {
      BotToast.showLoading();
      apiResult = await authservice.postcartData();
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          hasError.value = apiResult.hasError!;
        } else {
          hasError.value = apiResult.hasError!;
          massage.value = apiResult.errorMassage!;
          DialogsUtils.showdialog(
              m: massage.value,
              onPressed: () {
                Get.back();
                Get.back();
              });
        }
      } else {
        postcartData();
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
            Get.back();
          });
    } finally {
      BotToast.closeAllLoading();
    }
  }

  postfavorateData() async {
    try {
      BotToast.showLoading();
      apiResult = await authservice.postfavorateData();
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          hasError.value = apiResult.hasError!;
        } else {
          hasError.value = apiResult.hasError!;
          massage.value = apiResult.errorMassage!;
          DialogsUtils.showdialog(
              m: massage.value,
              onPressed: () {
                Get.back();
                Get.back();
              });
        }
      } else {
        postfavorateData();
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
            Get.back();
          });
    } finally {
      BotToast.closeAllLoading();
    }
  }
}
