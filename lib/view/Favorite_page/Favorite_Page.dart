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
  void initState() {
    if (statusCode.Token == '') {
      List<dynamic> fav = Constansbox.box.read('favorite');
      List<int> favo = [];
      fav.forEach((e) => favo.add(e));
      if (favo.length != 0)
        prodController.getListproduct(
            Listproduct: favo, q: '', from: '', to: '');
      else
        prodController.isEmpty.value = true;
    } else {
      favoriteController.getfavorite('', '', '');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List Se = Constansbox.box.read('Search');
    List Search = new List.from(Se.reversed);
    DateTime now = DateTime.now();
    print('--------------');
    print(size.width);
    print(size.height);
    print('--------------');

    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: AppColors.whiteappbarColor,
          centerTitle: true,
          title: Text(
            'favorite'.tr,
            style: TextStyle(color: Colors.black),
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
                        height: size.height * 0.26,
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
                        child: ListView(
                          children: [
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    if (statusCode.Token == '') {
                                      List<dynamic> fav =
                                          Constansbox.box.read('favorite');
                                      List<int> favo = [];
                                      fav.forEach((e) => favo.add(e));
                                      prodController.getListproduct(
                                          Listproduct: favo,
                                          q: '',
                                          from: '',
                                          to: '');
                                    } else {
                                      favoriteController.getfavorite(
                                          '', '', '');
                                    }
                                    Get.back();
                                  });
                                },
                                child: Text('all'.tr)),
                            Divider(
                              color: AppColors.darkgreytextColor,
                            ),
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    if (statusCode.Token == '') {
                                      List<dynamic> fav =
                                          Constansbox.box.read('favorite');
                                      List<int> favo = [];
                                      fav.forEach((e) => favo.add(e));
                                      prodController.getListproduct(
                                          Listproduct: favo,
                                          q: _searchController.text,
                                          from: now
                                              .subtract(Duration(days: 7))
                                              .toString()
                                              .split(' ')[0],
                                          to: now.toString().split(' ')[0]);
                                    } else {
                                      favoriteController.getfavorite(
                                          _searchController.text,
                                          now
                                              .subtract(Duration(days: 7))
                                              .toString()
                                              .split(' ')[0],
                                          now.toString().split(' ')[0]);
                                    }
                                    Get.back();
                                  });
                                },
                                child: Text('thisweek'.tr)),
                            Divider(
                              color: AppColors.darkgreytextColor,
                            ),
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    if (statusCode.Token == '') {
                                      List<dynamic> fav =
                                          Constansbox.box.read('favorite');
                                      List<int> favo = [];
                                      fav.forEach((e) => favo.add(e));
                                      prodController.getListproduct(
                                          Listproduct: favo,
                                          q: _searchController.text,
                                          from: now
                                              .subtract(Duration(days: 30))
                                              .toString()
                                              .split(' ')[0],
                                          to: now.toString().split(' ')[0]);
                                    } else {
                                      favoriteController.getfavorite(
                                          _searchController.text,
                                          now
                                              .subtract(Duration(days: 30))
                                              .toString()
                                              .split(' ')[0],
                                          now.toString().split(' ')[0]);
                                    }
                                    Get.back();
                                  });
                                },
                                child: Text('lastmonth'.tr)),
                            Divider(
                              color: AppColors.darkgreytextColor,
                            ),
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    if (statusCode.Token == '') {
                                      List<dynamic> fav =
                                          Constansbox.box.read('favorite');
                                      List<int> favo = [];
                                      fav.forEach((e) => favo.add(e));
                                      prodController.getListproduct(
                                          Listproduct: favo,
                                          q: _searchController.text,
                                          from: now
                                              .subtract(Duration(days: 180))
                                              .toString()
                                              .split(' ')[0],
                                          to: now.toString().split(' ')[0]);
                                    } else {
                                      favoriteController.getfavorite(
                                          _searchController.text,
                                          now
                                              .subtract(Duration(days: 180))
                                              .toString()
                                              .split(' ')[0],
                                          now.toString().split(' ')[0]);
                                    }
                                    Get.back();
                                  });
                                },
                                child: Text('last6month'.tr)),
                            Divider(
                              color: AppColors.darkgreytextColor,
                            ),
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    if (statusCode.Token == '') {
                                      List<dynamic> fav =
                                          Constansbox.box.read('favorite');
                                      List<int> favo = [];
                                      fav.forEach((e) => favo.add(e));
                                      prodController.getListproduct(
                                          Listproduct: favo,
                                          q: _searchController.text,
                                          from: now
                                              .subtract(Duration(days: 362))
                                              .toString()
                                              .split(' ')[0],
                                          to: now.toString().split(' ')[0]);
                                    } else {
                                      favoriteController.getfavorite(
                                          _searchController.text,
                                          now
                                              .subtract(Duration(days: 362))
                                              .toString()
                                              .split(' ')[0],
                                          now.toString().split(' ')[0]);
                                    }
                                    Get.back();
                                  });
                                },
                                child: Text('lastyear'.tr)),
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
                                    labelText: 'search'.tr,
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
                                    List Search =
                                        Constansbox.box.read('Search');
                                    var sh = Search.any((e) {
                                      return e == _searchController.text;
                                    });
                                    if (!sh) {
                                      if (_searchController.text != '') {
                                        Search.add(_searchController.text);
                                        Constansbox.box.write('Search', Search);
                                      }
                                    }

                                    opensearch = !opensearch;
                                    if (statusCode.Token == '') {
                                      List<dynamic> fav =
                                          Constansbox.box.read('favorite');
                                      List<int> favo = [];
                                      fav.forEach((e) => favo.add(e));
                                      prodController.getListproduct(
                                          Listproduct: favo,
                                          q: _searchController.text,
                                          from: '',
                                          to: '');
                                    } else {
                                      favoriteController.getfavorite(
                                          _searchController.text, '', '');
                                    }
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
                            itemCount: Search.length > 4 ? 4 : Search.length,
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
                                onTap: () {
                                  setState(() {
                                    _searchController = TextEditingController(
                                        text: Search[index]);
                                  });
                                },
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      Search[index],
                                    ),
                                  ),
                                ),
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
              ? !favoriteController.isEmpty.value
                  ? favoriteController.favorites.length != 0
                      ? Container(
                          width: size.width,
                          height: size.height,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/png/background.png'))),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Divider(
                                        height: 1,
                                        thickness: 1,
                                        indent: 0,
                                        endIndent: 0,
                                        color: Colors.grey,
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Container(
                                            color: AppColors.greyColor,
                                            child: SubcategoryFavorite(
                                              favoriteController:
                                                  favoriteController
                                                      .favorites[
                                                          favoriteController
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
                                              horizontal:
                                                  Defaults.defaultPadding),
                                          child: StaggeredGridView.countBuilder(
                                            shrinkWrap: true,
                                            crossAxisCount: 2,
                                            itemCount: favoriteController
                                                .favorites[favoriteController
                                                    .idcategory.value]
                                                .subCategories[
                                                    favoriteController
                                                        .idsupcategory.value]
                                                .products
                                                .length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return FullCard(
                                                size: size,
                                                product: favoriteController
                                                    .favorites[
                                                        favoriteController
                                                            .idcategory.value]
                                                    .subCategories[
                                                        favoriteController
                                                            .idsupcategory
                                                            .value]
                                                    .products[index],
                                              );
                                            },
                                            staggeredTileBuilder: (int index) =>
                                                new StaggeredTile.count(
                                                    1,
                                                    size.height >= 750
                                                        ? 1.22
                                                        : 1.1),
                                            mainAxisSpacing: 1,
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
                  : Center(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/png/background.png'))),
                        child: Center(
                          child: ListView(children: [
                            Divider(
                              height: 1,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child:
                                  SvgPicture.asset('assets/svg/subscribe.svg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: SvgPicture.asset(
                                  'assets/svg/No favorite to show.svg'),
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
                      ),
                    )
              : !prodController.isEmpty.value
                  ? prodController.prods.length != 0
                      ? Container(
                          width: size.width,
                          height: size.height,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/png/background.png'))),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
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
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    horizontal: Defaults
                                                        .defaultPadding),
                                                child: StaggeredGridView
                                                    .countBuilder(
                                                  shrinkWrap: true,
                                                  crossAxisCount: 2,
                                                  itemCount: prodController
                                                      .prods[favoriteController
                                                          .idcategory.value]
                                                      .subCategories[
                                                          favoriteController
                                                              .idsupcategory
                                                              .value]
                                                      .products
                                                      .length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return FullCard(
                                                      size: size,
                                                      product: prodController
                                                          .prods[
                                                              favoriteController
                                                                  .idcategory
                                                                  .value]
                                                          .subCategories[
                                                              favoriteController
                                                                  .idsupcategory
                                                                  .value]
                                                          .products[index],
                                                    );
                                                  },
                                                  staggeredTileBuilder: (int
                                                          index) =>
                                                      new StaggeredTile.count(
                                                          1,
                                                          size.height >= 750
                                                              ? 1.22
                                                              : 1.1),
                                                  mainAxisSpacing: 1,
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
                        )
                  : Center(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/png/background.png'))),
                        child: Center(
                          child: ListView(children: [
                            Divider(
                              height: 1,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child:
                                  SvgPicture.asset('assets/svg/subscribe.svg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: SvgPicture.asset(
                                  'assets/svg/No favorite to show.svg'),
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
                      ),
                    );
        }));
  }
}
