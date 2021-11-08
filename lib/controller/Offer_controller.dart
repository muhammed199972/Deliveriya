import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Offer_model.dart';
import 'package:delivery_food/services/Offer_service.dart';
import 'package:get/state_manager.dart';

class OfferController extends GetxController {
  var offers = <OffersResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  OfferService offer = OfferService();
  @override
  void onInit() {
    getoffers();
    super.onInit();
  }

  getoffers() async {
    try {
      apiResult = (await offer.getofferData())!;
      if (!apiResult.hasError!) {
        offers.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        print(offers);
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
      }
    } finally {}
  }
}
