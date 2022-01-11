import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/Shimmer_loading.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/model/Products_model.dart';
import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:delivery_food/view/Products_page.dart/component/Category_Scroll.dart';
import 'package:delivery_food/view/Products_page.dart/component/Products_Cards.dart';
import 'package:delivery_food/view/Products_page.dart/component/Subcategory_Scroll.dart';
import 'package:delivery_food/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProduvtsView extends StatelessWidget {
  ProduvtsView({
    Key? key,
    this.idcategory,
  }) : super(key: key);
  int? idcategory;
  var prodController = Get.find<ProductsController>();
  var cartController = Get.find<CartController>();
  // List<ProductsResponse> temp = [];
  // List<int>? list = [];
  // void move() async {
  //   await cartController.getcart();
  //   cartController.lenghcart.value = 0;
  //   for (int k = 0; k < cartController.carts.length; k++) {
  //     for (int i = 0; i < cartController.carts[k].subCategories.length; i++) {
  //       cartController.lenghcart.value = cartController.lenghcart.value +
  //           cartController.carts[k].subCategories[i].products.length;
  //     }
  //   }
  // }

  StatusCode statusCode = StatusCode();
  @override
  Widget build(BuildContext context) {
    if (statusCode.Token == '') {
      List cart = Constansbox.box.read('cartsid');
      cartController.lenghcart.value = cart.length;
    } else {
      // move();
    }

    Size size = MediaQuery.of(context).size;
    print(size.height);
    return Scaffold(
      // bottomNavigationBar:BottomBar(intid: 1,) ,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.whiteappbarColor,
        title: Center(
          child: Text(
            'Products',
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.offAll(BottomBar(
              fu: HomeView(),
            ));
          },
          icon: Icon(Icons.arrow_back_rounded),
          color: AppColors.blackColor,
        ),
        actions: [
          Container(
            width: 60,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.offAll(
                        BottomBar(
                          intid: 0,
                          fu: HomeView(),
                        ),
                      );
                    },
                    icon: SvgPicture.asset(
                      'assets/svg/Cart icon.svg',
                      color: AppColors.mainColor,
                      width: size.width >= 600 ? 45 : 25,
                    ),
                  ),
                ),
                if (statusCode.Token != '')
                  Obx(() {
                    return cartController.lenghcart.value == 0
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Text(
                                    '${cartController.lenghcart.value}',
                                    style: TextStyle(
                                        fontSize: size.width >= 600 ? 25 : 16,
                                        color: AppColors.mainColor),
                                  ),
                                ],
                              ),
                            ),
                          );
                  }),
                if (statusCode.Token == '')
                  Obx(
                    () => cartController.lenghcart.value == 0
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Text(
                                    '${cartController.lenghcart.value}',
                                    style: TextStyle(
                                        fontSize: size.width >= 600 ? 20 : 14,
                                        color: AppColors.mainColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          return await Get.offAll(
            BottomBar(
              fu: HomeView(),
            ),
          );
        },
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/png/background.png'),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 0,
                  child: Container(
                    color: AppColors.greyColor,
                    child: Column(
                      children: [
                        CategorysScroll(
                          size: size,
                          iSfavorite: false,
                          // subcategory: subcategory,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        SubcategoryScroll(
                          size: size,
                          // subcategory: subcategory,
                        ),
                        const Divider(
                          height: 20,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  )),
              Obx(() {
                // move();
                return Expanded(
                  flex: 4,
                  child: prodController.isLoading.value
                      ? ShimmerWidget.productsLoading()
                      : Container(
                          margin: EdgeInsets.only(
                            left: Defaults.defaultPadding,
                            right: Defaults.defaultPadding / 2,
                          ),
                          child: StaggeredGridView.countBuilder(
                            controller: prodController.scrollController,
                            shrinkWrap: true,
                            crossAxisCount: size.width <= 350
                                ? 2
                                : (size.width >= 600 ? 4 : 3),
                            itemCount: prodController.products.length,
                            itemBuilder: (BuildContext context, int index) {
                              // print('object');
                              // print(prodController.products[index].carts[0]
                              //     ['quantity']);

                              var loadingcart = false.obs;
                              return FullCard(
                                loadingcart: loadingcart,
                                size: size,
                                product: prodController.products[index],
                              );
                            },
                            staggeredTileBuilder: (int index) =>
                                new StaggeredTile.count(
                                    1, size.height >= 650 ? 1.22 : 1.18),
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 10,
                          ),
                        ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
