import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FullCard extends StatelessWidget {
  FullCard({
    Key? key,
    required this.size,
    required this.product,
    required this.loadingcart,
  }) : super(key: key);
  //
  var loadingcart = false.obs;
  final Size size;
  dynamic product;
  var cartController = Get.find<CartController>();
  var favoriteController = Get.find<FavoriteController>();
  StatusCode statusCode = StatusCode();
  Constans Constansbox = Constans();
  var favorite = false.obs;
  var isCart = false.obs;
  var cleckevent1 = false.obs;
  var cleckevent2 = false.obs;

  var counter = 0.obs;
  @override
  Widget build(BuildContext context) {
    countFavAndCart();
    return Stack(
      children: [
        Container(
          height: size.width <= 350 ? size.height * 0.3 : size.height * 0.2,
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
                    height: size.width <= 350
                        ? size.height * 0.17
                        : size.height * 0.1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            statusCode.urlimage + product!.avatar!,
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
                Text(
                  product!.name!,
                  style: statusCode.Lang == 'en'
                      ? size.width >= 600
                          ? Styles.defualttab
                          : Styles.defualtmobile
                      : size.width >= 600
                          ? Styles.priceStyle2
                          : Styles.priceStyle,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Obx(() {
                            return SvgPicture.asset(
                              'assets/svg/Cart icon.svg',
                              color: isCart.value
                                  ? AppColors.mainColor
                                  : Colors.grey[800],
                            );
                          }),
                        ),
                      ),
                      Obx(
                        () => Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                addtofav();
                              },
                              child: Icon(
                                favorite.value
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: AppColors.mainColor,
                                size: size.width <= 350
                                    ? 20
                                    : (size.width >= 600 ? 40 : 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${NumberFormat.decimalPattern().format(product.price)}\$',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: product.afterOffer != null
                                      ? AppColors.mainColor
                                      : AppColors.blackColor,
                                  decoration: product.afterOffer != null
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  fontSize: size.width >= 600
                                      ? 20
                                      : product.afterOffer != null
                                          ? 10
                                          : 12,
                                ),
                              ),
                              product.afterOffer != null
                                  ? Text(
                                      '${NumberFormat.decimalPattern().format(product.afterOffer)}\$',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: size.width >= 550 ? 20 : 10,
                                      ),
                                    )
                                  : Container()
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(() {
          return Positioned(
            right: 0,
            top: isCart.value ? 0 : 27,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    cleckevent1.value = true;
                    cleckevent2.value = true;

                    if (cleckevent2.value) {
                      if (counter < product.max)
                        counter = counter + product.min;
                    }

                    loadingcart.value = true;
                    isCart.value
                        ? await cartController.patchcart({
                            "ids": [
                              {
                                'productId': product!.id,
                                'quantity': counter.value,
                              }
                            ]
                          })
                        : addtocart();
                    loadingcart.value = false;
                  },
                  child: Container(
                    margin:
                        EdgeInsets.only(bottom: Defaults.defaultPadding / 3.5),
                    height:
                        size.width <= 350 ? 25 : (size.width >= 600 ? 40 : 20),
                    width:
                        size.width <= 350 ? 25 : (size.width >= 600 ? 40 : 20),
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
                          fontSize: size.width <= 350
                              ? 25
                              : (size.width >= 600 ? 40 : 17),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isCart.value,
                  child: Container(
                    margin:
                        EdgeInsets.only(bottom: Defaults.defaultPadding / 3.5),
                    height: size.width >= 600 ? 40 : 35,
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
                        child: loadingcart.value
                            ? Container(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ))
                            : Padding(
                                padding: EdgeInsets.only(left: 4, right: 4),
                                child: Column(children: [
                                  Expanded(
                                      child: Text(
                                    '${counter.value}',
                                    style: TextStyle(
                                      fontSize: (size.width >= 600 ? 20 : 10),
                                    ),
                                  )),
                                  Expanded(
                                      child: Text(
                                    '${product.measuringUnit}',
                                    style: TextStyle(
                                      fontSize: (size.width >= 600 ? 20 : 10),
                                    ),
                                  ))
                                ]),
                              ),
                      );
                    }),
                  ),
                ),
                Visibility(
                  visible: isCart.value,
                  child: InkWell(
                    onTap: () async {
                      if (counter.value == 0) {
                        cleckevent2.value = false;
                      } else if (counter.value < 0) {
                        cleckevent1.value = false;
                      } else {
                        counter = counter - product.min;
                        loadingcart.value = true;
                        isCart.value
                            ? await cartController.patchcart({
                                "ids": [
                                  {
                                    'productId': product!.id,
                                    'quantity': counter.value,
                                  }
                                ]
                              })
                            : null;
                        loadingcart.value = false;
                      }
                    },
                    child: Container(
                        height: size.width <= 350
                            ? 25
                            : (size.width >= 600 ? 40 : 20),
                        width: size.width <= 350
                            ? 25
                            : (size.width >= 600 ? 40 : 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset:
                                  Offset(10, 10), // changes position of shadow
                            ),
                          ],
                        ),
                        child: counter.value != product.min
                            ? Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.width <= 350
                                        ? 25
                                        : (size.width >= 600 ? 40 : 20),
                                  ),
                                ),
                              )
                            : Center(
                                child: InkWell(
                                  onTap: () {
                                    if (isCart.value) addtocart();
                                    cleckevent1.value = false;
                                  },
                                  child: Icon(
                                    Icons.delete_outlined,
                                    size: size.width <= 350
                                        ? 15
                                        : (size.width >= 600 ? 40 : 20),
                                  ),
                                ),
                              )),
                  ),
                )
              ],
            ),
          );
        })
      ],
    );
  }

  void countFavAndCart() {
    if (statusCode.Token == '') {
      List fav = Constansbox.box.read('favorite');
      favorite.value =
          fav.any((element) => element != product.id ? false : true);
    } else {
      if (product.favorites.isNotEmpty) {
        favorite.value = true;
      }
    }
    if (statusCode.Token == '') {
      List cart = Constansbox.box.read('cartsid');
      isCart.value =
          cart.any((element) => element != product.id ? false : true);
    } else {
      if (product.carts.isNotEmpty) {
        isCart.value = true;
        counter.value = product.carts[0]['quantity'];
      }
    }
  }

  void addtofav() {
    if (favorite.value) {
      if (statusCode.Token != '') {
        favoriteController.deleteFavorites(product!.id);
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
  }

  void addtocart() {
    if (isCart.value) {
      if (statusCode.Token == '') {
        List cartsid = Constansbox.box.read('cartsid');
        List cartscount = Constansbox.box.read('cartscounte');

        for (int i = 0; i < cartsid.length; i++) {
          if (cartsid[i] == product!.id) {
            cartsid.removeAt(i);
            cartscount.removeAt(i);
          }
        }
        cartController.lenghcart.value = cartsid.length;

        Constansbox.box.write('cartscounte', cartscount);

        Constansbox.box.write('cartsid', cartsid);
        isCart.value = false;
      } else {
        cartController.deletecart(product!.id.toString());
        cartController.lenghcart.value--;
        cartController.deleteCarts != null
            ? isCart.value = false
            : isCart.value = true;
      }

      // cart.value = false;
    } else {
      if (counter.value == 0) {
        BotToast.showText(
          text: 'choose your quantity',
          align: Alignment.center,
        );
      } else {
        if (statusCode.Token == '') {
          List cartsid = Constansbox.box.read('cartsid');

          cartsid.add(product!.id);
          Constansbox.box.write('cartsid', cartsid);

          List cartscount = Constansbox.box.read('cartscounte');

          cartscount.add(counter.value);

          Constansbox.box.write('cartscounte', cartscount);
          cartController.lenghcart.value = cartsid.length;

          isCart.value = true;
        } else {
          cartController.addTocart(counter.value, product!.id.toString());
          cartController.lenghcart.value++;
          cartController.postCarts != null
              ? isCart.value = true
              : isCart.value = false;
        }
      }
    }
  }
}
