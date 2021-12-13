import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/Shimmer_loading.dart';
import 'package:delivery_food/controller/Favorite_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/view/Favorite_page/Category_favorite.dart';
import 'package:delivery_food/view/Favorite_page/Subcategory_favorite.dart';
import 'package:delivery_food/view/Products_page.dart/component/Products_Cards.dart';

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
      prodController.getListproduct(Listproduct: favo);
    } else {
      favoriteController.getfavorite();
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
        body: Obx(() {
          return statusCode.Token != ''
              ? favoriteController.favorites.length != 0
                  ? Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/png/background.png'))),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CategorysFavorite(
                              size: size,
                              favoriteController: favoriteController
                                  .favorites, // subcategory: subcategory,
                            ),
                            Container(
                              height: double.infinity,
                              width: size.width / 1.51,
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 0,
                                    child: Container(
                                        color: AppColors.greyColor,
                                        child: SubcategoryFavorite(
                                          favoriteController: favoriteController
                                              .favorites[favoriteController
                                                  .idcategory.value]
                                              .subCategories,
                                          size: size,
                                          // subcategory: subcategory,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 11,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: Defaults.defaultPadding),
                                      child: StaggeredGridView.countBuilder(
                                        shrinkWrap: true,
                                        crossAxisCount: 2,
                                        itemCount: favoriteController
                                            .favorites[favoriteController
                                                .idcategory.value]
                                            .subCategories[favoriteController
                                                .idsupcategory.value]
                                            .products
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return FullCard(
                                            size: size,
                                            product: favoriteController
                                                .favorites[favoriteController
                                                    .idcategory.value]
                                                .subCategories[
                                                    favoriteController
                                                        .idsupcategory.value]
                                                .products[index],
                                            isCart: false,
                                          );
                                        },
                                        staggeredTileBuilder: (int index) =>
                                            new StaggeredTile.count(1, 1.39),
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
                  : Center(
                      child: CircularProgressIndicator(),
                    )
              : prodController.prods.length != 0
                  ? Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/png/background.png'))),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CategorysFavorite(
                              size: size,
                              favoriteController: prodController
                                  .prods, // subcategory: subcategory,
                            ),
                            Container(
                              height: double.infinity,
                              width: size.width / 1.51,
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 0,
                                    child: Container(
                                        color: AppColors.greyColor,
                                        child: SubcategoryFavorite(
                                          favoriteController: prodController
                                              .prods[favoriteController
                                                  .idcategory.value]
                                              .subCategories,
                                          size: size,
                                          // subcategory: subcategory,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 11,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: Defaults.defaultPadding),
                                      child: StaggeredGridView.countBuilder(
                                        shrinkWrap: true,
                                        crossAxisCount: 2,
                                        itemCount: prodController
                                            .prods[favoriteController
                                                .idcategory.value]
                                            .subCategories[favoriteController
                                                .idsupcategory.value]
                                            .products
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return FullCard(
                                            size: size,
                                            product: prodController
                                                .prods[favoriteController
                                                    .idcategory.value]
                                                .subCategories[
                                                    favoriteController
                                                        .idsupcategory.value]
                                                .products[index],
                                            isCart: false,
                                          );
                                        },
                                        staggeredTileBuilder: (int index) =>
                                            new StaggeredTile.count(1, 1.39),
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
                  : Center(
                      child: CircularProgressIndicator(),
                    );
        }));
  }
}
