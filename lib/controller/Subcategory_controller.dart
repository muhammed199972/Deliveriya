import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Subcategory_model.dart';
import 'package:delivery_food/services/Subcategory_services.dart';
import 'package:get/get.dart';

class ControllerSubcategorys extends GetxController {
  var subcategorys = <SubcategoryResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  SubcategoryService subcategory = SubcategoryService();

  @override
  void onInit() {
    getsubcategory();
    super.onInit();
  }

  getsubcategory() async {
    try {
      apiResult = await subcategory.getsubcategoryData();
      if (!apiResult.hasError!) {
        subcategorys.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        print(subcategorys[0].name);
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
      }
    } finally {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
    }
  }
}
