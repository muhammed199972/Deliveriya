import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Products_controller.dart';
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
    // this.subcategory,
  }) : super(key: key);
  int? idcategory;
  // var subcategory;
  var prodController = Get.find<ProductsController>();
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
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svg/Cart icon.svg',
              color: AppColors.mainColor,
              width: 40,
            ),
          )
        ],
      ),
      body: Column(
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
          Expanded(
            flex: 5,
            child: prodController.products == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Defaults.defaultPadding),
                    child: Obx(() => StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          itemCount: prodController.products.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    right: Defaults.defaultPadding / 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.transparent,
                                ),
                                child: FullCard(
                                  size: size,
                                  product: prodController.products[index],
                                ),
                              ),
                              Positioned(right: 0, child: Buttons_plus_minus())
                            ],
                          ),
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.count(1, 1.3),
                          mainAxisSpacing: 25,
                          crossAxisSpacing: 15,
                        )),
                  ),
          ),
        ],
      ),
    );
  }
}
