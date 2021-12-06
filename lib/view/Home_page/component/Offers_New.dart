import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Ads_controller.dart';
import 'package:delivery_food/controller/Offer_controller.dart';
import 'package:delivery_food/controller/Statuses_all.dart';
import 'package:delivery_food/view/Home_page/component/Statuses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_animation/ripple_animation.dart';

class Offers_New extends StatelessWidget {
  Offers_New({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  OfferController offer = Get.find<OfferController>();
  AdssController adss = Get.find<AdssController>();
  StatusesController statuses = Get.find<StatusesController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: Defaults.defaultPadding,
              right: Defaults.defaultPadding / 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('offers'.tr),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.to(() => Statuses(
                          typeclass: 'Offers',
                        ));
                  },
                  child: Obx(() {
                    if (offer.offers.length != 0) {
                      offer.checkStatuses();
                      if (offer.isOffStatuts.value || statuses.booloff.value) {
                        return Container(
                          height: size.height * 0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                              color: AppColors.lightmainColor,
                              width: 1,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              scale: 1,
                              image: NetworkImage(offer
                                  .offers[offer.offers.length - 1].avatar
                                  .toString()),
                            ),
                          ),
                        );
                      } else {
                        return RippleAnimation(
                          repeat: true,
                          color: AppColors.mainColor,
                          minRadius: 35,
                          ripplesCount: 2,
                          duration: const Duration(milliseconds: 2500),
                          delay: const Duration(milliseconds: 1),
                          child: Container(
                            height: size.height * 0.09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(
                                color: AppColors.lightmainColor,
                                width: 1,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                scale: 1,
                                image: NetworkImage(offer
                                    .offers[offer.offers.length - 1].avatar
                                    .toString()),
                              ),
                            ),
                          ),
                        );
                      }
                    } else {
                      return Container(
                        height: size.height * 0.09,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                            color: AppColors.lightmainColor,
                            width: 1,
                          ),
                        ),
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              right: Defaults.defaultPadding,
              left: Defaults.defaultPadding / 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('new'.tr),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.to(() => Statuses(
                          typeclass: 'New',
                        ));
                  },
                  child: Obx(() {
                    if (adss.adss.length != 0) {
                      adss.checkStatuses();
                      if (adss.isNewStatuts.value || statuses.boolnew.value) {
                        return Container(
                          height: size.height * 0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                              color: AppColors.lightmainColor,
                              width: 1,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              scale: 1,
                              image: NetworkImage(adss
                                  .adss[adss.adss.length - 1].avatar
                                  .toString()),
                            ),
                          ),
                        );
                      } else {
                        return RippleAnimation(
                          repeat: true,
                          color: AppColors.mainColor,
                          minRadius: 35,
                          ripplesCount: 2,
                          duration: const Duration(milliseconds: 2500),
                          delay: const Duration(milliseconds: 1),
                          child: Container(
                            height: size.height * 0.09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(
                                color: AppColors.lightmainColor,
                                width: 1,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                scale: 1,
                                image: NetworkImage(adss
                                    .adss[adss.adss.length - 1].avatar
                                    .toString()),
                              ),
                            ),
                          ),
                        );
                      }
                    } else {
                      return Container(
                        height: size.height * 0.09,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                            color: AppColors.mainColor,
                            width: 1,
                          ),
                        ),
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
