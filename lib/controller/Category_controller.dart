import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/services/Category_services.dart';
import 'package:delivery_food/model/Category_model.dart';
import 'package:get/get.dart';

class Categorys extends GetxController {
  var categorys = List<CategoryResponse>().obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  Category category = Category();

  @override
  void onInit() {
    getcategory();
    super.onInit();
  }

  getcategory() async {
    try {
      apiResult = await category.getCategoryData();
      if (!apiResult.hasError) {
        categorys.value = apiResult.data;
        hasError.value = apiResult.hasError;
        print(categorys[0].name);
      } else {
        hasError.value = apiResult.hasError;
        massage.value = apiResult.errorMassage;
      }
    } finally {
      hasError.value = apiResult.hasError;
      massage.value = apiResult.errorMassage;
    }
  }
}
