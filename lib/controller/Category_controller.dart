import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/services/Category_services.dart';
import 'package:delivery_food/model/Category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorysController extends GetxController {
  var categorys = <CategoryResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  var value = 0.obs;
  var controllerList = ScrollController().obs;
  var isLoading = true.obs;
  ApiResult apiResult = ApiResult();
  CategoryService category = CategoryService();

  @override
  void onInit() {
    super.onInit();
  }

  changecontrollerscroll(int index) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        if (controllerList.value.hasClients) {
          controllerList.value.animateTo(70 * index.toDouble(),
              duration: Duration(milliseconds: 700),
              curve: Curves.fastOutSlowIn);
        }
      },
    );
  }

  changevalue(int v) async {
    value.value = await v;
  }

  getcategory() async {
    try {
      apiResult = await category.getCategoryData();
      if (!apiResult.hasError!) {
        categorys.value = apiResult.data;
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
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
          });
    }
  }
}
