import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/Cart_model.dart';
import 'package:delivery_food/model/Delete.dart';
import 'package:delivery_food/model/Patch_data.dart';
import 'package:delivery_food/model/Post_data.dart';
import 'package:delivery_food/services/Cart_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  //
  var carts = <CartResponse>[].obs;

  var postCarts = PostResponse().obs;
  //
  var patchCarts = PatchResponse().obs;
  //
  var deleteCarts = DeleteResponse().obs;
  //
  var hasError = true.obs;
  //
  var priceall = 0.obs;
  var lenghcart = 0.obs;
  var massage = ''.obs;
  var isLoading = true.obs;
  ApiResult apiResult = ApiResult();
  CartService cartService = CartService();
  ScrollController listScrollController = ScrollController();
  var maxscroll = false.obs;
  var isEmpty = false.obs;

  @override
  void onInit() {
    // getcart();
    listScrollController.addListener(() {
      if (listScrollController.position.pixels ==
          listScrollController.position.maxScrollExtent) {
        maxscroll.value = true;
      } else
        maxscroll.value = false;
    });
    super.onInit();
  }

  getcart() async {
    try {
      apiResult = await cartService.getcartData();
      if (!apiResult.hasError!) {
        isEmpty.value = apiResult.isEmpty;
        carts.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        isLoading.value = false;
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
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
            Get.back();
          });
    }
  }

  addTocart(int quantity, String id) async {
    try {
      apiResult = await cartService.postcartData(quantity, id);
      if (!apiResult.hasError!) {
        carts.value = [];
        postCarts.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        BotToast.showLoading();
        await getcart();
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

  patchcart(var body) async {
    try {
      apiResult = await cartService.patchcartData(body);
      if (!apiResult.hasError!) {
        patchCarts.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        getcart();
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
      print(e);
    } finally {
      BotToast.closeAllLoading();
    }
  }

  deletecart(id) async {
    try {
      apiResult = await cartService.deletecartData(id);
      if (!apiResult.hasError!) {
        deleteCarts.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        BotToast.showLoading();
        await getcart();
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

  changecontrollerscroll() {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        if (listScrollController.hasClients) {
          listScrollController.animateTo(
              listScrollController.position.pixels + 185,
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastOutSlowIn);
        }
      },
    );
  }
}
