import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/view/Cart_page/Component/Categor_Sub_Cart.dart';
import 'package:delivery_food/view/Cart_page/Component/TotalPrice.dart';
import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:delivery_food/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);
  var controller = Get.put(CartController());
  var prodController = Get.find<ProductsController>();
  @override
  StatusCode statusCode = StatusCode();
  Widget build(BuildContext context) {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 2,
        // leading: Icon(
        //   Icons.arrow_back_rounded,
        //   color: AppColors.blackColor,
        // ),
        title: Text(
          'cart'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.blackColor,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/png/hestory.png',
                width: 40,
              )),
        ],
      ),
      body: Obx(() {
        return statusCode.Token != ''
            ? !controller.isEmpty.value
                ? controller.carts.length != 0
                    ? Container(
                        width: size.width,
                        height: size.height,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/png/background.png'),
                          ),
                        ),
                        child: Column(
                          children: [
                            Divider(
                              height: 1,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                            Expanded(
                              flex: 10,
                              child: CategoryCart(
                                  size: size, control: controller.carts),
                            ),
                            Expanded(child: TotalPrice())
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )
                : Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/png/background.png'))),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child:
                                  SvgPicture.asset('assets/svg/empty-cart.svg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: SvgPicture.asset(
                                  'assets/svg/Your cart is empty.svg'),
                            ),
                            InkWell(
                              onTap: () {
                                // Get.off(BottomBar(
                                //   fu: HomeView(),
                                // ));
                              },
                              child: Center(
                                child: Text(
                                  'Find your favorite',
                                  style: TextStyle(
                                    color: Colors.red,
                                    decoration: TextDecoration.underline,
                                  ),
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
                            image: AssetImage('assets/png/background.png'),
                          ),
                        ),
                        child: Column(
                          children: [
                            Divider(
                              height: 1,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                            Expanded(
                              flex: 10,
                              child: CategoryCart(
                                  size: size, control: prodController.prods),
                            ),
                            Expanded(child: TotalPrice())
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )
                : Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/png/background.png'))),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child:
                                  SvgPicture.asset('assets/svg/empty-cart.svg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: SvgPicture.asset(
                                  'assets/svg/Your cart is empty.svg'),
                            ),
                            InkWell(
                              onTap: () {
                                // Get.off(BottomBar(
                                //   fu: HomeView(),
                                // ));
                              },
                              child: Center(
                                child: Text(
                                  'Find your favorite',
                                  style: TextStyle(
                                    color: Colors.red,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                  );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        splashColor: AppColors.lightmainColor,
        backgroundColor: AppColors.mainColor,
        child: Text('submit'.tr),
      ),
    );
  }
}
