import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/Address.dart';
import 'package:delivery_food/model/City_model.dart';
import 'package:delivery_food/model/DeletePutPost.dart';

import 'package:delivery_food/services/Address_services.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var address = <AddressResponse>[].obs;
  var postaddress = DeletePutPostResponse().obs;
  var cities = <CitiesResponse>[].obs;
  var towns = <Townm>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  var vCity = ''.obs;
  var vTown = ''.obs;
  ApiResult apiResult = ApiResult();
  AddressService addressService = AddressService();
  var data = AddressResponse().obs;
  @override
  void onInit() {
    getCiteis();
    getaddress();
    super.onInit();
  }

  getCiteis() async {
    try {
      BotToast.showLoading();
      apiResult = await addressService.getCityData();
      if (!apiResult.hasError!) {
        cities.value = apiResult.data;
        hasError.value = apiResult.hasError!;
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
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
          });
    } finally {
      BotToast.closeAllLoading();
    }
  }

  getTown(String id) async {
    try {
      BotToast.showLoading();
      apiResult = await addressService.getTownData(id);
      if (!apiResult.hasError!) {
        towns.value = apiResult.data;
        hasError.value = apiResult.hasError!;

        update();
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
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
          });
    } finally {
      BotToast.closeAllLoading();
    }
  }

  getaddress() async {
    try {
      BotToast.showLoading();
      apiResult = await addressService.getaddressData();
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          address.value = apiResult.data;
          hasError.value = apiResult.hasError!;
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
        getaddress();
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

  addAddress(Map<String, dynamic> body) async {
    try {
      apiResult = await addressService.postaddressData(body);
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          postaddress.value = apiResult.data;
          hasError.value = apiResult.hasError!;
          BotToast.showLoading();
          await getaddress();
          Get.back();
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
        addAddress(body);
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

  deleteAddress(String id) async {
    try {
      apiResult = await addressService.deleteaddressData(id);
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          postaddress.value = apiResult.data;
          hasError.value = apiResult.hasError!;
          BotToast.showLoading();
          await getaddress();
          Get.back();
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
        deleteAddress(id);
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
}
