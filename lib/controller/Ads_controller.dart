import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Ads_model.dart';
import 'package:delivery_food/services/Ads_services.dart';
import 'package:get/get.dart';

class AdssController extends GetxController {
  var adss = <AdsResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  AdsService ads = AdsService();

  @override
  void onInit() {
    getAds();
    super.onInit();
  }

  getAds() async {
    try {
      apiResult = await ads.getAdsData();
      if (!apiResult.hasError!) {
        adss.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        print(adss[0].id);
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
