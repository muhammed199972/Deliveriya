import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/controller/Offer_controller.dart';
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
  Constans Constansbox = Constans();
  OfferController? off;
  var boolnew = false.obs;
  var booloff = false.obs;

  var date = '';

  @override
  void onInit() {
    controller = StoryController();
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  int iNew = 0;
  int ioffers = 0;
  int ilogo = 0;
  storeStatuses(var items, String typeclass) {
    // box.remove('New');
    // box.remove('offers');

    if (typeclass == 'logo') {
      print(ilogo);
      print(offers.length);

      if (ilogo < offers.length) {
        print(';;;;;;;;');
        var off = Constansbox.box.read('offers');
        for (int i = ioffers; i < offers.length; i++) {
          var bo = off.any((element) => element != offers[i].id ? false : true);
          if (!bo) {
            off.add(offers[i].id!);
            ioffers++;
            ilogo++;
            break;
          } else {
            ioffers++;
            ilogo++;

            break;
          }
        }
        box.remove('offers');
        Constansbox.box.write('offers', off);

        // print(Constansbox.box.read('offers'));
      } else {
        var New = Constansbox.box.read('New');

        for (int i = iNew; i < adss.length; i++) {
          var bo = New.any((element) => element != adss[i].id ? false : true);
          if (!bo) {
            New.add(adss[i].id!);
            iNew++;
            ilogo++;
            break;
          } else {
            iNew++;
            ilogo++;
            break;
          }
        }
        box.remove('New');
        Constansbox.box.write('New', New);
      }
    }

    // print(Constansbox.box.read('New'));

    if (typeclass == 'New') {
      var New = Constansbox.box.read('New');

      for (int i = iNew; i < adss.length; i++) {
        var bo = New.any((element) => element != adss[i].id ? false : true);
        if (!bo) {
          New.add(adss[i].id!);
          iNew++;
          break;
        } else {
          iNew++;
          break;
        }
      }
      box.remove('New');
      Constansbox.box.write('New', New);
      // print(Constansbox.box.read('New'));
    }

    if (typeclass == 'Offers') {
      var off = Constansbox.box.read('offers');
      for (int i = ioffers; i < offers.length; i++) {
        var bo = off.any((element) => element != offers[i].id ? false : true);
        if (!bo) {
          off.add(offers[i].id!);
          ioffers++;
          break;
        } else {
          ioffers++;
          break;
        }
      }
      box.remove('offers');
      Constansbox.box.write('offers', off);
      // print(Constansbox.box.read('offers'));
    }
  }

  getoffers() async {
    try {
      apiResultOffer = (await offer.getofferData())!;

      if (!apiResultOffer.hasError!) {
        offers = apiResultOffer.data;
        hasError = apiResultOffer.hasError!;
        statusItems = [];
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
        DialogsUtils.showdialog(
            m: massage,
            onPressed: () {
              Get.back();
            });
        update();
      }
    } catch (e) {
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
            Get.back();
          });
    }
  }

  getAds() async {
    try {
      apiResultAds = await ads.getAdsData();
      if (!apiResultAds.hasError!) {
        adss = apiResultAds.data;
        hasError = apiResultAds.hasError!;
        statusItems = [];
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
        DialogsUtils.showdialog(
            m: massage,
            onPressed: () {
              Get.back();
              Get.back();
            });
        update();
      }
    } catch (e) {
      hasError = apiResultAds.hasError!;
      massage = apiResultAds.errorMassage!;
      update();
    }
  }

  void addStatusItems() async {
    try {
      apiResultOffer = (await offer.getofferData())!;
      apiResultAds = await ads.getAdsData();

      if (!apiResultOffer.hasError! && !apiResultAds.hasError!) {
        offers = apiResultOffer.data;
        adss = apiResultAds.data;
        hasError = apiResultOffer.hasError!;
        statusItems = [];
        for (final status in offers) {
          statusItems.add(StoryItem.pageImage(
            url: status.avatar!,
            controller: controller,
            duration: Duration(
              milliseconds: (5 * 1000).toInt(),
            ),
          ));
        }
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
        hasError = apiResultOffer.hasError!;
        massage = apiResultOffer.errorMassage!;
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  void handleCompletedNew() {
    iNew = 0;
    boolnew.value = true;
    Get.back();
  }

  void handleCompletedoffers() {
    ioffers = 0;
    booloff.value = true;
    Get.back();
  }

  void handleCompletedall() {
    ioffers = 0;
    iNew = 0;
    ilogo = 0;
    boolnew.value = true;
    booloff.value = true;
    Get.back();
  }
}
