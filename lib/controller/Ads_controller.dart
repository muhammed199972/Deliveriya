import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Ads_model.dart';
import 'package:delivery_food/services/Ads_services.dart';
import 'package:get/get.dart';

class Adss extends GetxController {
  var adss = List<AdsResponse>().obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  Ads ads = Ads();

  @override
  void onInit() {
    getAds();
    super.onInit();
  }

  getAds() async {
    try {
      apiResult = await ads.getCategoryData();
      if (!apiResult.hasError) {
        adss.value = apiResult.data;
        hasError.value = apiResult.hasError;
        print(adss[0].id);
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
