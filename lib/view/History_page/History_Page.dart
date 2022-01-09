import 'dart:developer';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Order_controller.dart';
import 'package:delivery_food/model/Img_History.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var controller = Get.find<OrderController>();
  var _searchController = TextEditingController();
  var opensearch = false;
  var index1 = 0.obs;
  var index2 = 0.obs;
  StatusCode status = StatusCode();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteappbarColor,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.blackColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Order History',
          style: TextStyle(color: AppColors.blackColor),
        ),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       Get.bottomSheet(Container(
          //         padding: EdgeInsets.symmetric(
          //             horizontal: Defaults.defaultPadding * 2.5,
          //             vertical: Defaults.defaultPadding / 2),
          //         height: size.height * 0.196,
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(20),
          //             topRight: Radius.circular(20),
          //           ),
          //           boxShadow: [
          //             BoxShadow(
          //               color: AppColors.darkgreyColor,
          //               offset: Offset(0, -2),
          //               blurRadius: 5,
          //               spreadRadius: 2,
          //             )
          //           ],
          //         ),
          //         child: Column(
          //           children: [
          //             InkWell(
          //                 splashColor: Colors.transparent,
          //                 highlightColor: Colors.transparent,
          //                 onTap: () {},
          //                 child: Text('This Week')),
          //             Divider(
          //               color: AppColors.darkgreytextColor,
          //             ),
          //             InkWell(
          //                 splashColor: Colors.transparent,
          //                 highlightColor: Colors.transparent,
          //                 onTap: () {},
          //                 child: Text('Last month')),
          //             Divider(
          //               color: AppColors.darkgreytextColor,
          //             ),
          //             InkWell(
          //                 splashColor: Colors.transparent,
          //                 highlightColor: Colors.transparent,
          //                 onTap: () {},
          //                 child: Text('Last 6 months')),
          //             Divider(
          //               color: AppColors.darkgreytextColor,
          //             ),
          //             InkWell(
          //                 splashColor: Colors.transparent,
          //                 highlightColor: Colors.transparent,
          //                 onTap: () {},
          //                 child: Text('Last year')),
          //           ],
          //         ),
          //       ));
          //     },
          //     icon: SvgPicture.asset(
          //       'assets/svg/calender.svg',
          //       width: 40,
          //     )),
          !opensearch
              ? IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: SvgPicture.asset(
                    'assets/svg/search.svg',
                    width: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      opensearch = !opensearch;
                    });
                  },
                )
              : Container(),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(opensearch ? 60 : 0),
          child: !opensearch
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Defaults.defaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: Container(
                              height: 30,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  fillColor:
                                      AppColors.greyColor.withOpacity(0.5),
                                  filled: true,
                                  floatingLabelStyle:
                                      TextStyle(color: AppColors.mainColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.mainColor, width: 1.0),
                                  ),
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  labelText: 'search',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                controller: _searchController,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  controller.getorder(_searchController.text);
                                  opensearch = !opensearch;
                                });
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: SvgPicture.asset(
                                'assets/svg/search.svg',
                                width: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
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
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.orders.length,
                    itemBuilder: (context, int index) {
                      var index1 = index.obs;

                      ImgOrderResponse? temp;

                      controller.ordersImg.forEach((e) {
                        if (e.month ==
                            controller.orders[index].orderHistory
                                .toString()
                                .split(' ')[1]) {
                          temp = e;
                        }
                      });
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                        decoration: BoxDecoration(
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
                        child: Stack(children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            // bottom: 0,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(int.parse(temp!.color!))
                                          .withOpacity(0.2),
                                      Color(int.parse(temp!.color!))
                                          .withOpacity(0.5),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.greyColor.withOpacity(0.3),
                                      offset: Offset(0, 1),
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                    )
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: SvgPicture.network(
                                        status.urlimage + temp!.avatar!),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ExpansionTile(
                            textColor: AppColors.blackColor,
                            collapsedTextColor: AppColors.blackColor,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  controller.orders[index].orderHistory
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width >= 600 ? 25 : 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${controller.orders[index].orders!.length} order',
                                  style: size.width >= 600
                                      ? Styles.defualttab
                                      : Styles.defualtmobile,
                                ),
                              ],
                            ),
                            onExpansionChanged: (p) {},
                            children: [
                              Container(
                                height: 75 *
                                    controller.orders[index].orders!.length
                                        .toDouble(),
                                child: ListView.builder(
                                    itemCount: controller
                                        .orders[index1.value].orders!.length,
                                    itemBuilder: (context, int index) {
                                      var index2 = index.obs;
                                      return Column(
                                        children: [
                                          Container(
                                            color: AppColors.whiteColor,
                                            child: ExpansionTile(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Order',
                                                            style: size.width >=
                                                                    600
                                                                ? Styles
                                                                    .defualttab
                                                                : Styles
                                                                    .defualtmobile,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '# ${controller.orders[index1.value].orders![index].id}',
                                                            style: size.width >=
                                                                    600
                                                                ? Styles
                                                                    .defualttab
                                                                : Styles
                                                                    .defualtmobile,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        controller
                                                            .orders[
                                                                index1.value]
                                                            .orders![index]
                                                            .status
                                                            .toString(),
                                                        style: size.width >= 600
                                                            ? Styles.defualttab
                                                            : Styles
                                                                .defualtmobile,
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .orders[
                                                                index1.value]
                                                            .orders![index]
                                                            .createdAt
                                                            .toString()
                                                            .substring(0, 10),
                                                        style: size.width >= 600
                                                            ? Styles.defualttab
                                                            : Styles
                                                                .defualtmobile,
                                                      ),
                                                      Text(
                                                        '${controller.orders[index1.value].orders![index].finalPrice} \$',
                                                        style: size.width >= 600
                                                            ? Styles.defualttab
                                                            : Styles
                                                                .defualtmobile,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              textColor: AppColors.blackColor,
                                              collapsedTextColor:
                                                  AppColors.blackColor,
                                              onExpansionChanged: (b) {
                                                b
                                                    ? Get.bottomSheet(
                                                        Container(
                                                          padding: EdgeInsets
                                                              .all(Defaults
                                                                  .defaultPadding),
                                                          height:
                                                              size.height * 0.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(20),
                                                            ),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: AppColors
                                                                    .greyColor
                                                                    .withOpacity(
                                                                        0.3),
                                                                offset: Offset(
                                                                    0, -2),
                                                                blurRadius: 5,
                                                                spreadRadius: 2,
                                                              )
                                                            ],
                                                          ),
                                                          child:
                                                              ListView.builder(
                                                            itemCount: controller
                                                                .orders[index1
                                                                    .value]
                                                                .orders![index2
                                                                    .value]
                                                                .orderItems!
                                                                .length,
                                                            itemBuilder: (context,
                                                                    int index) =>
                                                                Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      70,
                                                                  vertical: 6),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    controller
                                                                        .orders[index1
                                                                            .value]
                                                                        .orders![index2
                                                                            .value]
                                                                        .orderItems![
                                                                            index]
                                                                        .product!
                                                                        .name
                                                                        .toString(),
                                                                    style: size
                                                                                .width >=
                                                                            600
                                                                        ? Styles
                                                                            .defualttab
                                                                        : Styles
                                                                            .defualtmobile,
                                                                  ),
                                                                  Text(
                                                                    '${controller.orders[index1.value].orders![index2.value].orderItems![index].product!.price.toString()} \$',
                                                                    style: size
                                                                                .width >=
                                                                            600
                                                                        ? Styles
                                                                            .defualttab
                                                                        : Styles
                                                                            .defualtmobile,
                                                                  )
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
                                          Divider(),
                                        ],
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ]),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
