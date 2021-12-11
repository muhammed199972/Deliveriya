import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/Shimmer_loading.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/model/Products_model.dart';
import 'package:delivery_food/view/Products_page.dart/component/Category_Scroll.dart';
import 'package:delivery_food/view/Products_page.dart/component/Products_Cards.dart';
import 'package:delivery_food/view/Products_page.dart/component/Subcategory_Scroll.dart';
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
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
                Obx(() => cartController.carts.value.data?.length == 0
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(top: 3),
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
                            )),
                      )),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    CategorysScroll(
                      size: size,
                      idcategory: idcategory,
                      // subcategory: subcategory,
                    ),
                    SubcategoryScroll(
                      size: size,
                      // subcategory: subcategory,
                    ),
                  ],
                ),
              )),
          Obx(() {
            // move();
            return Expanded(
              flex: 5,
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
                            isCart: list!
                                .contains(prodController.products[index].id),
                          );
                        },
                        staggeredTileBuilder: (int index) =>
                            new StaggeredTile.count(1, 1.13),
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 15,
                      ),
                    ),
            );
          }),
        ],
      ),
    );
  }
}
