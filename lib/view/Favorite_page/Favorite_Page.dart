import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Favorite_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/model/Products_model.dart';
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
      List fav = Constansbox.box.read('favorite');
      print(fav);
      prodController.getListproduct(limit: 8, offset: 0, Listproduct: fav);
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
        body: Obx(() {
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
                          crossAxisCount: 2,
                          itemCount: favoriteController.favorites.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FullCard(
                                isCart: true,
                                size: size,
                                product: favoriteController.favorites[index]);
                          },
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.count(1, 1.3),
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
        }));
  }
}
