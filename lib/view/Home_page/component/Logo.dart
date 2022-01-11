import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Ads_controller.dart';
import 'package:delivery_food/controller/Offer_controller.dart';
import 'package:delivery_food/controller/Statuses_all.dart';
import 'package:delivery_food/view/Home_page/component/Statuses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_animation/ripple_animation.dart';

class LogoStatus extends StatelessWidget {
  OfferController offer = Get.find<OfferController>();
  AdssController adss = Get.find<AdssController>();
  StatusesController statuses = Get.find<StatusesController>();
  StatusCode statusCode = StatusCode();

  LogoStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(() {
      // offer.checkStatuses();
      // adss.checkStatuses();
      if (offer.offers.length != 0 && adss.adss.length != 0) {
        if ((!offer.isOffStatuts.value && !statuses.booloff.value) &&
            (!adss.isNewStatuts.value && !statuses.boolnew.value)) {
          return InkWell(
            highlightColor: Colors.transparent,
            onTap: () {
              Get.to(() => Statuses(
                    typeclass: 'logo',
                  ));
            },
            child: Container(
                height: size.height * 0.17,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.amber, AppColors.mainColor],
                  ),
                  // border: Border.all(
                  //   color: AppColors.mainColor,
                  //   width: 2,
                  // ),
                ),
                child: Center(
                    child: Container(
                  height: size.height * 0.16,
                  //  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('assets/png/logo.png'),
                          fit: BoxFit.fill)),
                ))
                //  Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(13),
                //       image: DecorationImage(
                //           image: NetworkImage(
                //               statusCode.urlimage + offer.offers[0].media.toString()),
                //           fit: BoxFit.fill)),
                //   width: double.infinity,
                //   margin: EdgeInsets.all(4),
                // ),
                ),
          );
        } else {
          return InkWell(
            highlightColor: Colors.transparent,
            onTap: () {
              Get.to(() => Statuses(
                    typeclass: 'logo',
                  ));
            },
            child: Container(
                height: size.height * 0.16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.mainColor,
                    width: 4,
                  ),
                ),
                child: Center(
                    child: Container(
                  //  width: double.infinity,
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('assets/png/logo.png'),
                          fit: BoxFit.fill)),
                ))),
          );
        }
      } else {
        return InkWell(
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(() => Statuses(
                  typeclass: 'logo',
                ));
          },
          child: Container(
              height: size.height * 0.17,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // border: Border.all(
                //   //   color: Colors.grey[600]!,
                //   width: 4,
                // ),
              ),
              child: Center(
                  child: Container(
                //  width: double.infinity,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/png/logo.png'),
                        fit: BoxFit.fill)),
              ))
              //  Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(13),
              //       image: DecorationImage(
              //           image: NetworkImage(
              //               statusCode.urlimage + offer.offers[0].media.toString()),
              //           fit: BoxFit.fill)),
              //   width: double.infinity,
              //   margin: EdgeInsets.all(4),
              // ),
              ),
        );
      }
    });
    // returnImage.asset('assets/png/logo.png')

    // InkWell(
    //   highlightColor: Colors.transparent,
    //   onTap: () {
    //     Get.to(() => Statuses(
    //           typeclass: 'logo',
    //         ));
    //   },

    // child: Padding(
    //   padding: const EdgeInsets.only(top: Defaults.defaultPadding),
    //   child:

    //  Stack(
    //   children: [

    //     RippleAnimation(
    //       repeat: true,
    //       color: AppColors.mainColor,
    //       minRadius: 35,
    //       ripplesCount: 7,
    //       duration: const Duration(milliseconds: 3000),
    //       delay: const Duration(milliseconds: 5),
    //       child: Container(),
    //     ),
    //     Center(
    //         child: Container(
    //             decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               color: Colors.white,
    //             ),
    //             child: Image.asset('assets/png/logo.png'))),
    //   ],
    // ),
  }
}
