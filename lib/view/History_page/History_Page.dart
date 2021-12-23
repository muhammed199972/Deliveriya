import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/view/Cart_page/Component/Categor_Sub_Cart.dart';
import 'package:delivery_food/view/Cart_page/Component/TotalPrice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
  var controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_rounded,
          color: AppColors.blackColor,
        ),
        title: Text(
          'Order History',
          style: TextStyle(color: AppColors.blackColor),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Defaults.defaultPadding * 2.5,
                      vertical: Defaults.defaultPadding / 2),
                  height: size.height * 0.196,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.darkgreyColor,
                        offset: Offset(0, -2),
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: Text('This Week')),
                      Divider(
                        color: AppColors.darkgreytextColor,
                      ),
                      InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: Text('Last month')),
                      Divider(
                        color: AppColors.darkgreytextColor,
                      ),
                      InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: Text('Last 6 months')),
                      Divider(
                        color: AppColors.darkgreytextColor,
                      ),
                      InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: Text('Last year')),
                    ],
                  ),
                ));
              },
              icon: SvgPicture.asset(
                'assets/svg/calender.svg',
                width: 40,
              )),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/png/background.png'),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, int index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/png/img.png')),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyColor.withOpacity(0.3),
                          offset: Offset(0, 1),
                          blurRadius: 3,
                          spreadRadius: 1,
                        )
                      ]),
                  child: ExpansionTile(
                    textColor: AppColors.blackColor,
                    collapsedTextColor: AppColors.blackColor,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text('March'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('2021'),
                          ],
                        ),
                        Text('120 order'),
                      ],
                    ),
                    onExpansionChanged: (p) {},
                    children: [
                      Container(
                        height: 50,
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, int index) => Container(
                            color: AppColors.whiteColor,
                            child: ExpansionTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Order'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('#5486'),
                                        ],
                                      ),
                                      Text('Canceld')
                                    ],
                                  ),
                                  Text('23/2/2020'),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('cold drink'),
                                      Text('16 \$')
                                    ],
                                  )
                                ],
                              ),
                              textColor: AppColors.blackColor,
                              collapsedTextColor: AppColors.blackColor,
                              onExpansionChanged: (b) {
                                b
                                    ? Get.bottomSheet(
                                        Container(
                                          padding: EdgeInsets.all(
                                              Defaults.defaultPadding),
                                          height: size.height * 0.2,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.greyColor
                                                    .withOpacity(0.3),
                                                offset: Offset(0, -2),
                                                blurRadius: 5,
                                                spreadRadius: 2,
                                              )
                                            ],
                                          ),
                                          child: ListView.builder(
                                            itemCount: 4,
                                            itemBuilder: (context, int index) =>
                                                Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 70,
                                                      vertical: 6),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('cold drink'),
                                                  Text('16 \$')
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
