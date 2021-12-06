import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/Subcategory_model.dart';
import 'package:delivery_food/services/Subcategory_services.dart';
import 'package:get/get.dart';

class SubcategorysControllers extends GetxController {
  var subcategorys = <SubcategoryResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  var isLoading = true.obs;

  ApiResult apiResult = ApiResult();
  SubcategoryService subcategory = SubcategoryService();
  var value = 0.obs;

  @override
  void onInit() {
    //  getsubcategory(value.value);
    super.onInit();
  }

  changevalue(int v) async {
    value.value = await v;
  }

  getsubcategory(int value) async {
    try {
      apiResult = await subcategory.getsubcategoryData(value);
      if (!apiResult.hasError!) {
        subcategorys.value = apiResult.data;

        await changevalue(subcategorys[0].id!);
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
            Get.back();
          });
    }
  }
}
