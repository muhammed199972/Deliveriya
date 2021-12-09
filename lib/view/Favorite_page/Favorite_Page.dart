import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/Shimmer_loading.dart';
import 'package:delivery_food/controller/Favorite_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/view/Products_page.dart/component/Category_Scroll.dart';
import 'package:delivery_food/view/Products_page.dart/component/Products_Cards.dart';
import 'package:delivery_food/view/Products_page.dart/component/Subcategory_Scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({Key? key}) : super(key: key);

  var favoriteController = Get.find<FavoriteController>();
  var prodController = Get.find<ProductsController>();
  StatusCode statusCode = StatusCode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (statusCode.Token == '') {
      List<dynamic> fav = Constansbox.box.read('favorite');
      List<int> favo = [];
      fav.forEach((e) => favo.add(e));
      prodController.getListproduct(limit: 8, offset: 0, Listproduct: favo);
    } else {
      favoriteController.getfavorite(0, 8);
    }

    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          title: Center(
            child: Text(
              'Favorite',
              style: TextStyle(color: Colors.black),
            ),
          ),
          leading: Icon(
            Icons.arrow_back_rounded,
            color: Colors.transparent,
          ),
          actions: [
            PopupMenuButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: AppColors.blackColor,
                ),
                elevation: 1,
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("Sort by date"),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text("Sort by category"),
                        value: 2,
                      ),
                    ])
          ],
        ),
        body: statusCode.Token != ''
            ? Constansbox.box.read('favorite').isNotEmpty
                ? Obx(() {
                    return favoriteController.favorites.length != 0
                        ? Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: Defaults.defaultPadding),
                                  child:
                                      //  Obx(() {
                                      //   return
                                      StaggeredGridView.countBuilder(
                                    shrinkWrap: true,
                                    crossAxisCount: 3,
                                    itemCount:
                                        favoriteController.favorites.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return FullCard(
                                          isCart: true,
                                          size: size,
                                          product: favoriteController
                                              .favorites[index]);
                                    },
                                    staggeredTileBuilder: (int index) =>
                                        new StaggeredTile.count(1, 1.35),
                                    mainAxisSpacing: 25,
                                    crossAxisSpacing: 15,
                                  ),
                                  // }),
                                ),
                              )
                            ],
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  })
                : Center(
                    child: Text('Favorites list is empty .....'),
                  )
            : Constansbox.box.read('favorite').isNotEmpty
                ? Obx(() {
                    print(prodController.products.length);
                    return prodController.products.length != 0
                        ? Container(
                            width: size.width,
                            height: size.height,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/png/background.png'))),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CategorysScroll(
                                    size: size,
                                    iSfavorite: true,
                                    // subcategory: subcategory,
                                  ),
                                  Container(
                                    height: double.infinity,
                                    width: size.width / 1.51,
                                    padding: EdgeInsets.only(top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 0,
                                          child: Container(
                                              color: AppColors.greyColor,
                                              child: SubcategoryScroll(
                                                size: size,
                                                // subcategory: subcategory,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 11,
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal:
                                                    Defaults.defaultPadding),
                                            child:
                                                StaggeredGridView.countBuilder(
                                              shrinkWrap: true,
                                              crossAxisCount: 2,
                                              itemCount: prodController
                                                  .products.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return FullCard(
                                                  size: size,
                                                  product: prodController
                                                      .products[index],
                                                  isCart: true,
                                                );
                                              },
                                              staggeredTileBuilder:
                                                  (int index) =>
                                                      new StaggeredTile.count(
                                                          1, 1.39),
                                              mainAxisSpacing: 25,
                                              crossAxisSpacing: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )

                        // // Column(
                        //     children: [
                        //       Expanded(
                        //         flex: 5,
                        //         child: Container(
                        //           margin: EdgeInsets.symmetric(
                        //               horizontal: Defaults.defaultPadding),
                        //           child:

                        //               StaggeredGridView.countBuilder(
                        //             shrinkWrap: true,
                        //             crossAxisCount: 3,
                        //             itemCount: prodController.products.length,
                        //             itemBuilder:
                        //                 (BuildContext context, int index) {
                        //               return FullCard(
                        //                   isCart: true,
                        //                   size: size,
                        //                   product:
                        //                       prodController.products[index]);
                        //             },
                        //             staggeredTileBuilder: (int index) =>
                        //                 new StaggeredTile.count(1, 1.35),
                        //             mainAxisSpacing: 25,
                        //             crossAxisSpacing: 15,
                        //           ),

                        //         ),
                        //       )
                        //     ],
                        //   )

                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  })
                : Center(
                    child: Text('Favorites list is empty .....'),
                  ));
  }
}
