import 'package:carousel_pro/carousel_pro.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Ads_controller.dart';
import 'package:delivery_food/controller/Offer_controller.dart';
import 'package:delivery_food/controller/Statuses_all.dart';
import 'package:delivery_food/view/Home_page/component/Statuses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offers_New extends StatelessWidget {
  Offers_New({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  OfferController offer = Get.find<OfferController>();
  AdssController adss = Get.find<AdssController>();
  StatusesController statuses = Get.find<StatusesController>();
  StatusCode statusCode = StatusCode();

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
                    if (offer.offers.length != 0 && adss.adss.length != 0) {
                      // offer.checkStatuses();
                      // if (offer.isOffStatuts.value || statuses.booloff.value) {
                      return Container(
                        height: size.height * 0.11,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          // border: Border.all(
                          //   color: Colors.grey[600]!,
                          //   width: 4,
                          // ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13.0),
                          child: Carousel(
                            images: [
                              for (int i = 0; i < offer.offers.length; i++)
                                GestureDetector(
                                  onTap: () async {
                                    Get.to(() => Statuses(
                                          typeclass: 'Offers',
                                        ));
                                  },
                                  child: Image.network(
                                    statusCode.urlimage +
                                        offer.offers[i].media.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                            ],
                            dotSize: 4.0,
                            dotSpacing: 25.0,
                            dotIncreasedColor: AppColors.mainColor,
                            indicatorBgPadding: 4,
                            dotBgColor: Colors.purple.withOpacity(0),
                            borderRadius: true,
                          ),
                        ),
                      );
                      // } else {
                      //   return Container(
                      //     height: size.height * 0.122,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(13),
                      //       border: Border.all(
                      //         color: AppColors.mainColor,
                      //         width: 4,
                      //       ),
                      //     ),
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(13),
                      //           image: DecorationImage(
                      //               image: NetworkImage(statusCode.urlimage +
                      //                   offer.offers[0].media.toString()),
                      //               fit: BoxFit.fill)),
                      //       width: double.infinity,
                      //       margin: EdgeInsets.all(4),
                      //     ),
                      //   );
                      // }
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
                      // adss.checkStatuses();
                      // if (adss.isNewStatuts.value || statuses.boolnew.value) {
                      return Container(
                        height: size.height * 0.11,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          // border: Border.all(
                          //   color: Colors.grey[600]!,
                          //   width: 4,
                          // ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13.0),
                          child: Carousel(
                            images: [
                              for (int i = 0; i < adss.adss.length; i++)
                                if (adss.adss[i].type == 'ad')
                                  GestureDetector(
                                    onTap: () async {
                                      Get.to(() => Statuses(
                                            typeclass: 'New',
                                          ));
                                    },
                                    child: Image.network(
                                      statusCode.urlimage +
                                          adss.adss[i].media.toString(),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                            ],
                            dotSize: 4.0,
                            dotSpacing: 25.0,
                            dotIncreasedColor: AppColors.mainColor,
                            indicatorBgPadding: 4,
                            dotBgColor: Colors.purple.withOpacity(0),
                            borderRadius: true,
                          ),
                        ),
                      );
                      // } else {
                      //   return Container(
                      //     height: size.height * 0.12,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(13),
                      //       border: Border.all(
                      //         color: AppColors.mainColor,
                      //         width: 4,
                      //       ),
                      //     ),
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(13),
                      //           image: DecorationImage(
                      //               image: NetworkImage(statusCode.urlimage +
                      //                   adss.adss[0].media.toString()),
                      //               fit: BoxFit.fill)),
                      //       width: double.infinity,
                      //       margin: EdgeInsets.all(4),
                      //     ),
                      //   );
                      // }
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
