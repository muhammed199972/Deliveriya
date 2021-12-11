import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FullCard extends StatelessWidget {
  FullCard(
      {Key? key,
      required this.size,
      required this.product,
      required this.isCart})
      : super(key: key);
  //
  bool? isCart;

  final Size size;
  var cartController = Get.find<CartController>();
  var favoriteController = Get.find<FavoriteController>();
  StatusCode statusCode = StatusCode();
  Constans Constansbox = Constans();
  dynamic product;
  var favorite = false.obs;
  var counter = 0.obs;
  @override
  Widget build(BuildContext context) {
    if (statusCode.Token == '') {
      List fav = Constansbox.box.read('favorite');
      favorite.value =
          fav.any((element) => element != product.id ? false : true);
    } else {
      if (product.favorites != null) {
        favorite.value = true;
      }
    }

    return Stack(
      children: [
        Container(
          height: size.height * 0.17,
          padding: EdgeInsets.only(right: Defaults.defaultPadding / 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.transparent,
          ),
          child: Container(
            margin: EdgeInsets.only(top: Defaults.defaultPadding / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 10), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(children: [
                  Container(
                    height: size.height * 0.09,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/png/img.png',
                            // product!.avatar!,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(5.0),
                        topRight: const Radius.circular(5.0),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 5,
                ),
                Text(product!.name!),
                Container(
                  height: size.height * 0.039,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            if (isCart!) {
                              cartController.deletecart(product!.id.toString());
                              // cart.value = false;
                            } else {
                              if (counter.value == 0) {
                                BotToast.showText(
                                  text: 'choose your quantity',
                                  align: Alignment.center,
                                );
                              } else {
                                cartController.addTocart(
                                    counter.value, product!.id.toString());
                              }

                              // cart.value = true;
                            }
                          },
                          child: SvgPicture.asset(
                            'assets/svg/Cart icon.svg',
                            color: isCart!
                                //  cart.value
                                ? AppColors.mainColor
                                : AppColors.greyColor,
                            width: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              if (favorite.value) {
                                if (statusCode.Token != '') {
                                  favoriteController
                                      .deleteFavorites(product!.id);
                                  favorite.value = false;
                                } else {
                                  var fav = Constansbox.box.read('favorite');
                                  fav.remove(product!.id);
                                  Constansbox.box.write('favorite', fav);
                                  favorite.value = false;
                                }
                              } else {
                                if (statusCode.Token != '') {
                                  favoriteController.addFavorite(product!.id);
                                  favorite.value = true;
                                } else {
                                  var fav = Constansbox.box.read('favorite');
                                  fav.add(product!.id);
                                  Constansbox.box.write('favorite', fav);
                                  favorite.value = true;
                                }
                              }
                            },
                            icon: Icon(
                              favorite.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: AppColors.mainColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${product!.price!}\$',
                          style: Styles.priceStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: !isCart!,
          child: Positioned(
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => counter++,
                  child: Container(
                    margin:
                        EdgeInsets.only(bottom: Defaults.defaultPadding / 2),
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(10, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: Defaults.defaultPadding / 2),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(10, 10), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Obx(() {
                    return Center(
                      child: Text('${counter.value}'),
                    );
                  }),
                ),
                InkWell(
                  onTap: () {
                    if (counter > 0) {
                      counter--;
                    }
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(10, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '-',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
