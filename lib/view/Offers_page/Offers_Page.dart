import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Offer_controller.dart';
import 'package:delivery_food/view/Products_page.dart/component/Products_Cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  OffersView({Key? key}) : super(key: key);
  OfferController offer = Get.find<OfferController>();
  StatusCode statusCode = StatusCode();
  @override
  Widget build(BuildContext context) {
    offer.getoffers();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        // leading: Icon(
        //   Icons.arrow_back_rounded,
        //   color: AppColors.blackColor,
        // ),
        backgroundColor: AppColors.whiteappbarColor,
        centerTitle: true,
        title: Text(
          'Offers',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/png/background.png'))),
        margin: EdgeInsets.symmetric(
            horizontal: Defaults.defaultPadding / 2,
            vertical: Defaults.defaultPadding / 1.2),
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          crossAxisCount: 1,
          itemCount: offer.offers.length,
          itemBuilder: (BuildContext context, int index) {
            var isCart = offer.idOffers
                .any((element) => element == offer.offers[index].id)
                .obs;
            return Obx(() {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 10), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (offer.offers[index].type == 'group')
                      InkWell(
                        onTap: () {
                          if (!isCart.value) {
                            isCart.value = true;
                            offer.postofferData(
                                offer.offers[index].id.toString());

                            offer.idOffers.add(offer.offers[index].id);
                            Constansbox.box.write('offersId', offer.idOffers);
                          } else {
                            isCart.value = false;
                            offer.deleteofferData(
                                offer.offers[index].id.toString());
                            for (int i = 0; i < offer.offers.length; i++) {
                              for (int j = 0; j < offer.idOffers.length; j++) {
                                if (offer.offers[i].id == offer.idOffers[j]) {
                                  offer.idOffers.removeAt(j);
                                }
                              }
                            }
                            Constansbox.box.write('offersId', offer.idOffers);
                          }
                        },
                        child: Container(
                          // height: 15,
                          // width: 15,
                          padding: EdgeInsets.only(bottom: 10, left: 10),
                          child: SvgPicture.asset(
                            'assets/svg/Cart icon.svg',
                            color: isCart.value
                                ? AppColors.blackColor
                                : AppColors.mainColor,
                            width: 30,
                          ),
                        ),
                      ),
                    if (offer.offers[index].type != 'group')
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10, left: 40),
                        ),
                      ),
                    Center(
                      child: Container(
                        child: RichText(
                          text: TextSpan(
                              style: size.width >= 600
                                  ? Styles.defualttab
                                  : Styles.defualtmobile,
                              text: offer.offers[index].description),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height / 5,
                      width: size.width / 3,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                        statusCode.urlimage + offer.offers[index].media!,
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              );
            });
          },
          staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 0.39),
          mainAxisSpacing: 7,
        ),
      ),
    );
  }
}
