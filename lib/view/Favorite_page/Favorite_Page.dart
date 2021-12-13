import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Favorite_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/view/Favorite_page/Component/Category_favorite.dart';
import 'package:delivery_food/view/Favorite_page/Component/Subcategory_favorite.dart';
import 'package:delivery_food/view/Products_page.dart/component/Products_Cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FavoriteView extends StatefulWidget {
  FavoriteView({Key? key}) : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  var favoriteController = Get.find<FavoriteController>();

  var prodController = Get.find<ProductsController>();

  var _searchController = TextEditingController();
  var opensearch = false;
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          centerTitle: true,
          title: Text(
            'Favorite',
            style: TextStyle(color: Colors.black),
          ),
          leading: Icon(
            Icons.arrow_back_rounded,
            color: Colors.transparent,
          ),
          actions: [
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
            !opensearch
                ? IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: SvgPicture.asset(
                      'assets/svg/menu.svg',
                      width: 30,
                    ),
                    onPressed: () {
                      Get.bottomSheet(Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Defaults.defaultPadding * 2.5,
                            vertical: Defaults.defaultPadding / 2),
                        height: size.height * 0.196,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.darkgreyColor,
                              offset: Offset(0, -2),
                              blurRadius: 5,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {},
                                child: Text('This Week')),
                            Divider(
                              color: AppColors.darkgreytextColor,
                            ),
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {},
                                child: Text('Last month')),
                            Divider(
                              color: AppColors.darkgreytextColor,
                            ),
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {},
                                child: Text('Last 6 months')),
                            Divider(
                              color: AppColors.darkgreytextColor,
                            ),
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {},
                                child: Text('Last year')),
                          ],
                        ),
                      ));
                    },
                  )
                : Container()
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
                                          color: AppColors.mainColor,
                                          width: 1.0),
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
                        Container(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          height: 40,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, int index) => Container(
                              height: size.height * 0.027,
                              width: size.width * 0.1505,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                                border: Border.all(
                                  color: AppColors.darkgreyColor,
                                  width: 1.5,
                                ),
                              ),
                              margin: EdgeInsets.only(
                                  left: Defaults.defaultPadding / 4,
                                  right: Defaults.defaultPadding / 1.5),
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          'lklklkl',
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
        backgroundColor: AppColors.whiteColor,
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
                        child: Column(
                          children: [
                            Expanded(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 0,
                                          child: Container(
                                              color: AppColors.greyColor,
                                              child: SubcategoryFavorite(
                                                favoriteController:
                                                    prodController
                                                        .prods[
                                                            favoriteController
                                                                .idcategory
                                                                .value]
                                                        .subCategories,
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
                                                  .prods[favoriteController
                                                      .idcategory.value]
                                                  .subCategories[
                                                      favoriteController
                                                          .idsupcategory.value]
                                                  .products
                                                  .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return FullCard(
                                                  size: size,
                                                  product: prodController
                                                      .prods[favoriteController
                                                          .idcategory.value]
                                                      .subCategories[
                                                          favoriteController
                                                              .idsupcategory
                                                              .value]
                                                      .products[index],
                                                  isCart: false,
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
