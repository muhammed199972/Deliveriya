import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/Address.dart';
import 'package:delivery_food/model/City_model.dart';
import 'package:delivery_food/model/Post_data.dart';
import 'package:delivery_food/services/Address_services.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var address = <AddressResponse>[].obs;
  var postaddress = PostResponse().obs;
  var cities = <CitiesResponse>[].obs;
  var towns = <Townm>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  var isLoading = true.obs;
  var vCity = ''.obs;
  var vTown = ''.obs;
  ApiResult apiResult = ApiResult();
  AddressService addressService = AddressService();
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
        isLoading.value = false;
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
      BotToast.cleanAll();
    }
  }

  getTown(String id) async {
    try {
      BotToast.showLoading();
      apiResult = await addressService.getTownData(id);
      if (!apiResult.hasError!) {
        towns.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        isLoading.value = false;

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
      BotToast.cleanAll();
    }
  }

  getaddress() async {
    try {
      BotToast.showLoading();
      apiResult = await addressService.getaddressData();
      if (!apiResult.hasError!) {
        address.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        isLoading.value = false;
        print(address[0].id);
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
    } finally {
      BotToast.cleanAll();
    }
  }

  addAddress(Map<String, dynamic> body) async {
    try {
      apiResult = await addressService.postaddressData(body);
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
      if (!apiResult.hasError!) {
        address.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        BotToast.showLoading();
        await getaddress();
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
    } finally {
      BotToast.closeAllLoading();
    }
  }
}
