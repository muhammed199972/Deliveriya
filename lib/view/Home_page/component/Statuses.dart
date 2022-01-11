import 'dart:developer';

import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Offer_controller.dart';
import 'package:delivery_food/controller/Statuses_all.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

class Statuses extends StatelessWidget {
  bool statusebool = true;
  String? typeclass;
  Statuses({this.typeclass});
  StatusCode statusCode = StatusCode();
  OfferController offer = Get.find<OfferController>();

  List<int> idoff = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: WillPopScope(
        onWillPop: () async {
          if (idoff.isNotEmpty)
            for (int i = 0; i < idoff.length; i++) {
              var isIdOffer = idoff
                  .any((element) => element == offer.offers[idoff[i]].id)
                  .obs;

              if (!isIdOffer.value) {
                offer.postofferData(offer.offers[idoff[i]].id.toString());

                offer.idOffers.add(offer.offers[idoff[i]].id);
                Constansbox.box.write('offersId', idoff);
              }
            }
          return true;
        },
        child: GetBuilder<StatusesController>(
            init: StatusesController(),
            builder: (statuse) {
              var isShow = true.obs;
              var id = 0.obs;
              if (statusebool) {
                statusebool = false;
                if (typeclass == 'logo') {
                  statuse.addStatusItems();
                } else if (typeclass == 'New') {
                  statuse.getAds();
                } else if (typeclass == 'Offers') {
                  statuse.getoffers();
                }
              }
              return Dismissible(
                key: const Key('key'),
                direction: DismissDirection.vertical,
                onDismissed: (_) {
                  if (idoff.isNotEmpty)
                    for (int i = 0; i < idoff.length; i++) {
                      var isIdOffer = idoff
                          .any(
                              (element) => element == offer.offers[idoff[i]].id)
                          .obs;

                      if (!isIdOffer.value) {
                        offer.postofferData(
                            offer.offers[idoff[i]].id.toString());

                        offer.idOffers.add(offer.offers[idoff[i]].id);
                        Constansbox.box.write('offersId', idoff);
                      }
                    }
                  Get.back();
                },
                child: Stack(
                  children: <Widget>[
                    statuse.statusItems.length != 0
                        ? Material(
                            type: MaterialType.transparency,
                            child: StoryView(
                              onStoryShow: (items) {
                                if (statuse.offers.length <=
                                    statuse.statusItems.indexOf(items)) {
                                  isShow.value = false;
                                } else {
                                  id.value = statuse.statusItems.indexOf(items);
                                  isShow.value = true;
                                }
                                statuse.storeStatuses(typeclass!);
                              },
                              storyItems: statuse.statusItems,
                              controller: statuse.controller,
                              onComplete: typeclass == 'New'
                                  ? statuse.handleCompletedNew
                                  : typeclass == 'Offers'
                                      ? statuse.handleCompletedoffers
                                      : statuse.handleCompletedall,
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                    statusCode.Token != ''
                        ? Obx(() {
                            return isShow.value &&
                                    typeclass != 'New' &&
                                    statuse.offers[id.value].type == 'group'
                                ? Positioned(
                                    bottom: 10,
                                    right: size.width / 3,
                                    left: size.width / 3,
                                    child: Center(
                                      child: TextButton(
                                        onPressed: () {
                                          statuse.idOfferCart.add(id.value);
                                          idoff.add(id.value);
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              // shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.red,
                                                  width: 3.0,
                                                  style: BorderStyle.solid
                                                  // Color color = const Color(0xFF000000),
                                                  // double width = 1.0,
                                                  // BorderStyle style = BorderStyle.solid,
                                                  )),
                                          child: Icon(
                                            Icons.add_shopping_cart_rounded,
                                            color: Colors.red,
                                            size: 40,
                                          ),
                                          // tooltip: 'Increase volume by 10',
                                        ),
                                      ),
                                    ),
                                  )
                                : Container();
                          })
                        : Container()
                  ],
                ),
              );
            }),
      ),
    );
  }
}
