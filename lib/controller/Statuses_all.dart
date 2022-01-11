import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/controller/Offer_controller.dart';
import 'package:delivery_food/model/Ads_model.dart';
import 'package:delivery_food/model/Offer_model.dart';
import 'package:delivery_food/services/Ads_services.dart';
import 'package:delivery_food/services/Offer_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:story_view/story_view.dart';

enum MediaType { image, video, text }

class Story {
  final MediaType? mediaType;
  final String? media;
  final String? color;

  Story({
    this.mediaType,
    this.media,
    this.color,
  });
}

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
  StatusCode statusCode = StatusCode();
  OfferController? off;
  var boolnew = false.obs;
  var booloff = false.obs;
  var boollogo = true.obs;
  var date = '';
  List<int> idOfferCart = [];
  @override
  void onInit() async {
    addStatusItems();
    controller = StoryController();
    idOffers = await Constansbox.box.read('offersId');
    super.onInit();
  }

  var idOffers = [];
  @override
  void onClose() {
    controller.dispose();

    super.onClose();
  }

  int iNew = 0;
  int ioffers = 0;
  int ilogo = 0;

  static MediaType _translateType(String? type) {
    if (type == "image") {
      return MediaType.image;
    }

    if (type == "video") {
      return MediaType.video;
    }

    return MediaType.text;
  }

  mediastatuse(var statuse) {
    final res = statuse.map<Story>((it) {
      return Story(
          color: it.color,
          media: it.media,
          mediaType: _translateType(it.mediaType));
    }).toList();

    res!.forEach((story) {
      if (story.mediaType == MediaType.text) {
        statusItems.add(
          StoryItem.text(
            title: story.caption!,
            backgroundColor: Colors.red,
            duration: Duration(
              milliseconds: (5 * 1000).toInt(),
            ),
          ),
        );
      }

      if (story.mediaType == MediaType.image) {
        statusItems.add(StoryItem.pageImage(
          url: statusCode.urlimage + story.media!,
          controller: controller,
          // caption: story.caption,
          duration: Duration(
            milliseconds: (5 * 1000).toInt(),
          ),
        ));
      }

      if (story.mediaType == MediaType.video) {
        statusItems.add(
          StoryItem.pageVideo(
            statusCode.urlimage + story.media!,
            controller: controller,

            duration: Duration(milliseconds: (5 * 1000).toInt()),
            // caption: 'lllllllll',
          ),
        );
      }
    });
  }

  storeStatuses(String typeclass) {
    if (typeclass == 'logo') {
      if (ilogo < offers.length) {
        boollogo.value = true;
        var off = Constansbox.box.read('offers');
        for (int i = ioffers; i < offers.length; i++) {
          var bo = off.any((element) => element != offers[i].id ? false : true);
          if (!bo) {
            off.add(offers[i].id ?? []);
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
      } else {
        boollogo.value = false;
        var New = Constansbox.box.read('New');
        for (int i = iNew; i < adss.length; i++) {
          var bo = New.any((element) => element != adss[i].id ? false : true);
          if (!bo) {
            New.add(adss[i].id ?? []);
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

    if (typeclass == 'New') {
      boollogo.value = false;

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
    }

    if (typeclass == 'Offers') {
      boollogo.value = true;

      var off = Constansbox.box.read('offers');
      for (int i = ioffers; i < offers.length; i++) {
        var bo = off.any((element) => element != offers[i].id ? false : true);
        if (!bo) {
          off.add(offers[i].id ?? []);
          ioffers++;
          break;
        } else {
          ioffers++;
          break;
        }
      }
      box.remove('offers');
      Constansbox.box.write('offers', off);
    }
  }

  getoffers() async {
    try {
      apiResultOffer = (await offer.getofferData())!;

      if (!apiResultOffer.hasError!) {
        offers = apiResultOffer.data;
        hasError = apiResultOffer.hasError!;
        statusItems = [];
        mediastatuse(offers);
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
        var ads = [];
        adss.forEach((ad) {
          if (ad.type == 'ad') {
            ads.add(ad);
          }
        });
        mediastatuse(ads);
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
        mediastatuse(offers);
        mediastatuse(adss);
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
    if (idOfferCart.isNotEmpty)
      for (int i = 0; i < idOfferCart.length; i++) {
        var isIdOffer =
            idOffers.any((element) => element == offers[idOfferCart[i]].id).obs;

        if (!isIdOffer.value) {
          offer.postofferData(offers[idOfferCart[i]].id.toString());

          idOffers.add(offers[idOfferCart[i]].id);
          Constansbox.box.write('offersId', idOffers);
        }
      }
    ioffers = 0;
    booloff.value = true;
    Get.back();
  }

  void handleCompletedall() {
    if (idOfferCart.isNotEmpty)
      for (int i = 0; i < idOfferCart.length; i++) {
        var isIdOffer =
            idOffers.any((element) => element == offers[idOfferCart[i]].id).obs;

        if (!isIdOffer.value) {
          offer.postofferData(offers[idOfferCart[i]].id.toString());

          idOffers.add(offers[idOfferCart[i]].id);
          Constansbox.box.write('offersId', idOffers);
        }
      }
    ioffers = 0;
    iNew = 0;
    ilogo = 0;
    boolnew.value = true;
    booloff.value = true;
    Get.back();
  }
}
