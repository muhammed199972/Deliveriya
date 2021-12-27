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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        // leading: Icon(
        //   Icons.arrow_back_rounded,
        //   color: AppColors.blackColor,
        // ),
        backgroundColor: AppColors.whiteColor,
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
            var isCart = false.obs;
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
                    InkWell(
                      onTap: () {
                        isCart.value
                            ? isCart.value = false
                            : isCart.value = true;
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
                    Center(
                      child: Container(
                        //   width: 150,
                        //      padding: EdgeInsets.only(bottom: 50),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: offer.offers[index].name),
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
