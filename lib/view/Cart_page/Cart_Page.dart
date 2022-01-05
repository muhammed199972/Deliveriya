import 'dart:developer';

import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Offer_controller.dart';
import 'package:delivery_food/controller/Order_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/view/Cart_page/CartConfirm.dart';
import 'package:delivery_food/view/Cart_page/Component/Categor_Sub_Cart.dart';
import 'package:delivery_food/view/Cart_page/Component/ListOfferCart.dart';
import 'package:delivery_food/view/Cart_page/Component/TotalPrice.dart';
import 'package:delivery_food/view/History_page/History_Page.dart';
import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:delivery_food/view/Virefy_pages/Choose_Page.dart';
import 'package:delivery_food/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);
  var controller = Get.put(CartController());
  var co = Get.put(OrderController());
  var prodController = Get.find<ProductsController>();
  var offerController = Get.find<OfferController>();

  @override
  StatusCode statusCode = StatusCode();
  Widget build(BuildContext context) {
    statusCode.Token != '' ? offerController.getofferuser() : null;
    Size size = MediaQuery.of(context).size;
    if (statusCode.Token == '') {
      List<dynamic> cart = Constansbox.box.read('cartsid');
      List<int> carts = [];
      cart.forEach((e) => carts.add(e));
      if (carts.length != 0) {
        prodController.isEmpty.value = false;
        prodController.getListproduct(
            Listproduct: carts, q: '', from: '', to: '');
      } else {
        prodController.isEmpty.value = true;
      }
    } else {
      controller.getcart();
    }
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteappbarColor,
          elevation: 1,
          centerTitle: true,
          title: Text(
            'cart'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.blackColor,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  if (statusCode.Token == '') {
                    Get.to(ChoseSign());
                  } else {
                    co.getorder('');
                    Get.to(() => HistoryPage());
                  }
                },
                icon: SvgPicture.asset(
                  'assets/svg/history.svg',
                  width: 40,
                )),
          ],
          bottom: TabBar(
            labelColor: AppColors.blackColor,
            tabs: <Widget>[
              Tab(
                text: 'Offers',
              ),
              Tab(
                text: 'Products',
              ),
            ],
          ),
        ),
        body: Obx(() {
          return Stack(
            children: [
              TabBarView(
                children: <Widget>[
                  ListOfferCart(
                      offerController: offerController,
                      size: size,
                      statusCode: statusCode),
                  statusCode.Token != ''
                      ? !controller.isEmpty.value
                          ? controller.carts.length != 0
                              ? Container(
                                  width: size.width,
                                  height: size.height,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/png/background.png'),
                                    ),
                                  ),
                                  child: CategoryCart(
                                      size: size, control: controller.carts),
                                )
                              : Container()
                          : Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/png/background.png'))),
                              child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: size.height > 550
                                            ? const EdgeInsets.all(30)
                                            : const EdgeInsets.all(10),
                                        child: SvgPicture.asset(
                                            'assets/svg/empty-cart.svg'),
                                      ),
                                      Padding(
                                        padding: size.height > 550
                                            ? const EdgeInsets.all(15)
                                            : const EdgeInsets.all(5),
                                        child: SvgPicture.asset(
                                            'assets/svg/Your cart is empty.svg'),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.offAll(BottomBar(
                                            fu: HomeView(),
                                          ));
                                        },
                                        child: Center(
                                          child: Text(
                                            'Find your favorite',
                                            style: TextStyle(
                                                color: Colors.red,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: size.width >= 600
                                                    ? 25
                                                    : 16),
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                            )
                      : !prodController.isEmpty.value
                          ? prodController.prods.length != 0
                              ? Container(
                                  width: size.width,
                                  height: size.height,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/png/background.png'),
                                    ),
                                  ),
                                  child: CategoryCart(
                                      size: size,
                                      control: prodController.prods),
                                )
                              : Container()
                          : Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/png/background.png'))),
                              child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: size.height > 550
                                            ? const EdgeInsets.all(30)
                                            : const EdgeInsets.all(10),
                                        child: SvgPicture.asset(
                                            'assets/svg/empty-cart.svg'),
                                      ),
                                      Padding(
                                        padding: size.height > 550
                                            ? const EdgeInsets.all(15)
                                            : const EdgeInsets.all(5),
                                        child: SvgPicture.asset(
                                            'assets/svg/Your cart is empty.svg'),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.offAll(BottomBar(
                                            fu: HomeView(),
                                          ));
                                        },
                                        child: Center(
                                          child: Text(
                                            'Find your favorite',
                                            style: TextStyle(
                                                color: Colors.red,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: size.width >= 600
                                                    ? 25
                                                    : 16),
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                ],
              ),
              Positioned(bottom: 0, right: 0, left: 0, child: TotalPrice())
            ],
          );
        }),
        floatingActionButton: Obx(() => Visibility(
              visible: controller.carts.length != 0 ||
                  offerController.offersuser.length != 0,
              child: FloatingActionButton(
                onPressed: () {
                  print(offerController.offers.length);
                  Get.to(() => ConfirmCart());
                },
                splashColor: AppColors.lightmainColor,
                backgroundColor: AppColors.mainColor,
                child: Text(
                  'submit'.tr,
                ),
              ),
            )),
      ),
    );
  }
}
