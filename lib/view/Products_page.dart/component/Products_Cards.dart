import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FullCard extends StatelessWidget {
  FullCard({
    Key? key,
    required this.size,
    required this.product,
  }) : super(key: key);
  //

  final Size size;
  var cartController = Get.find<CartController>();
  var favoriteController = Get.find<FavoriteController>();
  StatusCode statusCode = StatusCode();
  Constans Constansbox = Constans();
  dynamic product;
  var favorite = false.obs;
  var isCart = false.obs;
  var cleckevent1 = false.obs;
  var cleckevent2 = false.obs;
  var cleckevent3 = false.obs;

  var counter = 0.obs;
  @override
  Widget build(BuildContext context) {
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
      }
    }

    return Stack(
      children: [
        Container(
          height: size.height * 0.2,
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
                    height: size.height * 0.1,
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
                  style: size.width >= 600
                      ? Styles.defualttab
                      : Styles.defualtmobile,
                ),
                Container(
                  height: size.height * 0.03,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                if (isCart.value) {
                                  if (statusCode.Token == '') {
                                    List cartsid =
                                        Constansbox.box.read('cartsid');
                                    List cartscount =
                                        Constansbox.box.read('cartscounte');

                                    for (int i = 0; i < cartsid.length; i++) {
                                      if (cartsid[i] == product!.id) {
                                        cartsid.removeAt(i);
                                        cartscount.removeAt(i);
                                      }
                                    }
                                    cartController.lenghcart.value =
                                        cartsid.length;

                                    Constansbox.box
                                        .write('cartscounte', cartscount);

                                    Constansbox.box.write('cartsid', cartsid);
                                    isCart.value = false;
                                  } else {
                                    cartController
                                        .deletecart(product!.id.toString());
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
                                      List cartsid =
                                          Constansbox.box.read('cartsid');

                                      cartsid.add(product!.id);
                                      Constansbox.box.write('cartsid', cartsid);

                                      List cartscount =
                                          Constansbox.box.read('cartscounte');

                                      cartscount.add(counter.value);

                                      Constansbox.box
                                          .write('cartscounte', cartscount);
                                      cartController.lenghcart.value =
                                          cartsid.length;

                                      isCart.value = true;
                                    } else {
                                      cartController.addTocart(counter.value,
                                          product!.id.toString());
                                      cartController.lenghcart.value++;
                                      cartController.postCarts != null
                                          ? isCart.value = true
                                          : isCart.value = false;
                                    }
                                  }

                                  // cart.value = true;
                                }
                              },
                              child: Obx(() {
                                return SvgPicture.asset(
                                  'assets/svg/Cart icon.svg',
                                  color: isCart.value
                                      //  cart.value
                                      ? AppColors.mainColor
                                      : Colors.grey[800],
                                  width: size.width >= 600 ? 40 : 20,
                                );
                              })),
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
                              child: Icon(
                                favorite.value
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: AppColors.mainColor,
                                size: size.width >= 600 ? 40 : 20,
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
                                '${product.price}\$',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: product.afterOffer != null
                                      ? AppColors.mainColor
                                      : AppColors.blackColor,
                                  decoration: product.afterOffer != null
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  fontSize: size.width >= 600 ? 20 : 12,
                                ),
                              ),
                              product.afterOffer != null
                                  ? Text(
                                      '${product.afterOffer}\$',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: size.width >= 550 ? 20 : 12,
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
          return Visibility(
            visible: !isCart.value,
            child: Positioned(
              right: 0,
              top: cleckevent1.value ? 0 : 27,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (cleckevent1.value) {
                        cleckevent2.value = true;
                      }
                      cleckevent1.value = true;
                      if (cleckevent2.value) {
                        if (counter < product.max)
                          counter = counter + product.min;
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: Defaults.defaultPadding / 3.5),
                      height: size.width >= 600 ? 40 : 20,
                      width: size.width >= 600 ? 40 : 20,
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
                      child: Center(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: size.width >= 600 ? 40 : 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: cleckevent1.value,
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: Defaults.defaultPadding / 3.5),
                      height: size.width >= 600 ? 40 : 35,
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
                      child: Obx(() {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 4, right: 4),
                            child: Column(children: [
                              Expanded(
                                  child: Text(
                                '${counter.value}',
                                style: TextStyle(
                                    fontSize: size.width >= 600 ? 20 : 10),
                              )),
                              Expanded(
                                  child: Text(
                                '${product.measuringUnit}',
                                style: TextStyle(
                                    fontSize: size.width >= 600 ? 20 : 10),
                              ))
                            ]),
                          ),
                        );
                      }),
                    ),
                  ),
                  Visibility(
                    visible: cleckevent1.value,
                    child: InkWell(
                      onTap: () {
                        if (counter.value == 0) {
                          cleckevent2.value = false;
                        } else if (counter.value < 0) {
                          cleckevent1.value = false;
                        } else {
                          counter = counter - product.min;
                        }
                      },
                      child: Container(
                          height: size.width >= 600 ? 40 : 20,
                          width: size.width >= 600 ? 40 : 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(
                                    10, 10), // changes position of shadow
                              ),
                            ],
                          ),
                          child: cleckevent2.value
                              ? Center(
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width >= 600 ? 40 : 20,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: InkWell(
                                    onTap: () {
                                      cleckevent1.value = false;
                                    },
                                    child: Icon(
                                      Icons.delete_outlined,
                                      size: size.width >= 600 ? 40 : 20,
                                    ),
                                  ),
                                )),
                    ),
                  )
                ],
              ),
            ),
          );
        })
      ],
    );
  }
}
