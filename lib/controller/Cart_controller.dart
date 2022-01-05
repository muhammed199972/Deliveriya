import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/Cart_model.dart';
import 'package:delivery_food/model/DeletePutPost.dart';

import 'package:delivery_food/services/Cart_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  //
  var carts = <CartResponse>[].obs;

  var postCarts = DeletePutPostResponse().obs;
  //
  var patchCarts = DeletePutPostResponse().obs;
  //
  var deleteCarts = DeletePutPostResponse().obs;
  //
  var hasError = true.obs;
  //
  List<Map<String, dynamic>> updata = [];
  List<int> updatadelete = [];
  var priceall = 0.obs;
  var lenghcart = 0.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  CartService cartService = CartService();
  ScrollController listScrollController = ScrollController();
  var maxscroll = false.obs;
  var isEmpty = false.obs;
  var totalprice = 0.obs;
  var loadingtotal = true.obs;

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
      BotToast.showLoading();
      apiResult = await cartService.getcartData();
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          isEmpty.value = apiResult.isEmpty;
          carts.value = apiResult.data;
          hasError.value = apiResult.hasError!;
          totalprice.value = apiResult.totalprice;
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
        getcart();
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

  getcarttotal() async {
    try {
      loadingtotal = false.obs;
      apiResult = await cartService.getcartTotal();
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          totalprice.value = apiResult.totalprice;
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
        getcarttotal();
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
      loadingtotal.value = true;
    }
  }

  addTocart(int quantity, String id) async {
    try {
      apiResult = await cartService.postcartData(quantity, id);
      if (apiResult.rfreshToken) {
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
      } else {
        addTocart(quantity, id);
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
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          patchCarts.value = apiResult.data;
          hasError.value = apiResult.hasError!;
          BotToast.showLoading();
          await getcart();
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
        patchcart(body);
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
      if (apiResult.rfreshToken) {
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
      } else {
        deletecart(id);
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

  deletcategoryecart(String id) async {
    try {
      apiResult = await cartService.deletcategoryecart(id);
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          deleteCarts.value = apiResult.data;
          hasError.value = apiResult.hasError!;
          Get.find<CartController>().loadingtotal.value = false;

          await getcart();
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
        deletcategoryecart(id);
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
      Get.find<CartController>().loadingtotal.value = true;
    }
  }

  deletsupcategoryecart(String id) async {
    try {
      apiResult = await cartService.deletsupcategoryecart(id);
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          deleteCarts.value = apiResult.data;
          hasError.value = apiResult.hasError!;
          Get.find<CartController>().loadingtotal.value = false;

          await getcart();

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
        deletsupcategoryecart(id);
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
      Get.find<CartController>().loadingtotal.value = true;
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
