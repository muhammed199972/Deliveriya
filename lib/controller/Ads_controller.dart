import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/Ads_model.dart';
import 'package:delivery_food/services/Ads_services.dart';
import 'package:get/get.dart';

class AdssController extends GetxController {
  var adss = <AdsResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  var isLoading = true.obs;
  ApiResult apiResult = ApiResult();
  AdsService ads = AdsService();
  Constans Constansbox = Constans();
  var isNewStatuts = true.obs;
  @override
  void onInit() async {
    getAds();
    super.onInit();
  }

  checkStatuses() {
    var New = Constansbox.box.read('New');
    bool check = true;
    for (int i = 0; i < adss.length; i++) {
      check = New.any((element) => element == adss[i].id ? true : false);
      if (!check) {
        isNewStatuts.value = check;

        break;
      }
      print(New);
    }
  }

  getAds() async {
    try {
      apiResult = await ads.getAdsData();
      if (!apiResult.hasError!) {
        adss.value = apiResult.data;
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
}
