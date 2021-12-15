import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/Shimmer_loading.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/model/Products_model.dart';
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
  List<ProductsResponse> temp = [];
  List<int>? list = [];
  void move() {
    if (cartController.carts.value.data?.isNotEmpty ?? false)
      list = cartController.carts.value.data!
          .map<int>((element) => element.id!)
          .toList();
    list!.forEach((element) {
      temp = prodController.products.where((p0) => p0.id == element).toList();
      print(element);
    });
  }

  StatusCode statusCode = StatusCode();
  @override
  Widget build(BuildContext context) {
    if (statusCode.Token == '') {
      List cart = Constansbox.box.read('cartsid');
      cartController.lenghcart.value = cart.length;
    } else {
      cartController.getcart();
      move();
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // bottomNavigationBar:BottomBar(intid: 1,) ,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.greyColor,
        title: Center(
          child: Text(
            'Products',
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
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
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/Cart icon.svg',
                      color: AppColors.mainColor,
                      width: 40,
                    ),
                  ),
                ),
                if (statusCode.Token != '')
                  Obx(
                    () => cartController.carts.value.data?.length == 0
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 5, right: 5),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: AppColors.mainColor,
                                    child: Text(
                                      '${cartController.carts.value.data?.length ?? 0}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.whiteColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                if (statusCode.Token == '')
                  Obx(
                    () => cartController.lenghcart.value == 0
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 5, right: 5),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: AppColors.mainColor,
                                    child: Text(
                                      '${cartController.lenghcart.value}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.whiteColor),
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
                        margin: EdgeInsets.symmetric(
                            horizontal: Defaults.defaultPadding),
                        child: StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          itemCount: prodController.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FullCard(
                              size: size,
                              product: prodController.products[index],
                            );
                          },
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.count(1, 1.18),
                          mainAxisSpacing: 25,
                          crossAxisSpacing: 15,
                        ),
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
