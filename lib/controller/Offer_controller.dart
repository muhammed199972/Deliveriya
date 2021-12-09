import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/Offer_model.dart';
import 'package:delivery_food/services/Offer_service.dart';
import 'package:get/get.dart';

class OfferController extends GetxController {
  var offers = <OffersResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  OfferService offer = OfferService();
  Constans Constansbox = Constans();
  var isOffStatuts = true.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    getoffers();
    super.onInit();
  }

  checkStatuses() {
    var off = Constansbox.box.read('offers');
    bool check = true;
    for (int i = 0; i < offers.length; i++) {
      check = off.any((element) => element == offers[i].id ? true : false);
      if (!check) {
        isOffStatuts.value = check;

        break;
      }
    }
  }

  getoffers() async {
    try {
      apiResult = (await offer.getofferData())!;
      if (!apiResult.hasError!) {
        offers.value = apiResult.data;
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
