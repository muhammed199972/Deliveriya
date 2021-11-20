import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/services/Category_services.dart';
import 'package:delivery_food/model/Category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorysController extends GetxController {
  var categorys = <CategoryResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  CategoryService category = CategoryService();
  var value = 0.obs;
  var controllerList = ScrollController().obs;

  @override
  void onInit() {
    getcategory();
    super.onInit();
  }

  changecontrollerscroll(int index) {
    print(index);
    controllerList.value.animateTo(20 * index.toDouble(),
        duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
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
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
      }
    } catch (e) {
      print(e);
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
    }
  }
}
