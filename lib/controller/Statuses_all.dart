import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Ads_model.dart';
import 'package:delivery_food/model/Offer_model.dart';
import 'package:delivery_food/services/Ads_services.dart';
import 'package:delivery_food/services/Offer_service.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:story_view/story_view.dart';

class StatusesController extends GetxController {
  var offers = <OffersResponse>[];
  var adss = <AdsResponse>[];
  var hasError = true;
  var massage = '';
  ApiResult apiResultAds = ApiResult();
  ApiResult apiResultOffer = ApiResult();
  OfferService offer = OfferService();
  AdsService ads = AdsService();
  var statusItems = <StoryItem>[];
  late StoryController controller;
  var date = '';

  @override
  void onInit() {
    controller = StoryController();
    //addStatusItems();
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  getoffers() async {
    try {
      apiResultOffer = (await offer.getofferData())!;

      if (!apiResultOffer.hasError!) {
        offers = apiResultOffer.data;
        hasError = apiResultOffer.hasError!;
        for (final status in offers) {
          statusItems.add(StoryItem.pageImage(
            url: status.avatar!,
            controller: controller,
            duration: Duration(
              milliseconds: (5 * 1000).toInt(),
            ),
          ));
        }
        update();
      } else {
        hasError = apiResultOffer.hasError!;
        massage = apiResultOffer.errorMassage!;
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  getAds() async {
    try {
      apiResultAds = await ads.getAdsData();
      if (!apiResultAds.hasError!) {
        adss = apiResultAds.data;
        hasError = apiResultAds.hasError!;

        for (final status in adss) {
          statusItems.add(StoryItem.pageImage(
            url: status.avatar!,
            controller: controller,
            duration: Duration(
              milliseconds: (5 * 1000).toInt(),
            ),
          ));
        }
        update();
      } else {
        hasError = apiResultAds.hasError!;
        massage = apiResultAds.errorMassage!;
        update();
      }
    } catch (e) {
      hasError = apiResultAds.hasError!;
      massage = apiResultAds.errorMassage!;
      update();
    }
  }

  void addStatusItems() async {
    await getoffers();
    await getAds();
  }

  void handleCompleted() {
    Get.back();
    update();
  }
}
