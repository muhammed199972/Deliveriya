import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/view/Cart_page/Component/ButtonScroll.dart';
import 'package:delivery_food/view/Cart_page/Component/ButtonUpdate.dart';
import 'package:delivery_food/view/Cart_page/Component/ListProducts_Cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCart extends StatelessWidget {
  CategoryCart({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  var controller;
  var prodController = Get.find<ProductsController>();

  StatusCode statusCode = StatusCode();
  @override
  Widget build(BuildContext context) {
    List cartscounte = [];
    if (statusCode.Token == '') {
      for (int k = 0; k < controller.length; k++) {
        for (int i = 0; i < controller[k].subCategories.length; i++) {
          for (int l = 0;
              l < controller[k].subCategories[i].products.length;
              l++) {
            for (int y = 0; y < prodController.cartsid.length; y++) {
              if (controller[k].subCategories[i].products[l].id ==
                  prodController.cartsid[y]) {
                cartscounte.add(prodController.cartscounte[y]);
              }
            }
          }
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: ListView.builder(
          itemCount: controller.length,
          itemBuilder: (context, indexcat) {
            var visibleRemove = false.obs;
            var idcategory = 0.obs;
            var pricemcat = 0.obs;
            if (statusCode.Token != '') {
              for (int i = 0;
                  i < controller[indexcat].subCategories.length;
                  i++) {
                for (int l = 0;
                    l < controller[indexcat].subCategories[i].products.length;
                    l++) {
                  pricemcat +=
                      controller[indexcat].subCategories[i].products[l].price *
                          controller[indexcat]
                              .subCategories[i]
                              .products[l]
                              .Cartid[0]
                              .quantity;
                }
              }
            } else {
              if (cartscounte.length != 0) {
                for (int i = 0;
                    i < controller[indexcat].subCategories.length;
                    i++) {
                  for (int l = 0;
                      l < controller[indexcat].subCategories[i].products.length;
                      l++) {
                    indexcat == 0
                        ? pricemcat += controller[indexcat]
                                .subCategories[i]
                                .products[l]
                                .price *
                            cartscounte[l]
                        : pricemcat += controller[indexcat]
                                .subCategories[i]
                                .products[l]
                                .price *
                            cartscounte[controller[indexcat - 1]
                                    .subCategories[i]
                                    .products
                                    .length +
                                l];
                  }
                }
              }
            }

            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyColor.withOpacity(0.3),
                      offset: Offset(0, 1),
                      blurRadius: 3,
                      spreadRadius: 1,
                    )
                  ]),
              child: ExpansionTile(
                leading: Image.network(
                  statusCode.urlimage + controller[indexcat].icon!,
                  width: 30,
                  color: AppColors.mainColor,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller[indexcat].name!,
                      style: TextStyle(color: Colors.black),
                    ),
                    Row(
                      children: [
                        Text('${pricemcat.value} \$'),
                        Obx(
                          () => Visibility(
                            visible: visibleRemove.value,
                            child: IconButton(
                              splashColor: Colors.transparent,
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/png/remove.png',
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                onExpansionChanged: (p) {
                  visibleRemove.value = p;
                  idcategory.value = indexcat;
                },
                children: [
                  Container(
                    height: controller[idcategory.value].subCategories.length *
                        55.toDouble(),
                    child: ListView.builder(
                        itemCount:
                            controller[idcategory.value].subCategories.length,
                        itemBuilder: (context, indexsup) {
                          var visibleRemove = false.obs;
                          var idsupcategory = 0.obs;
                          var pricesup = 0.obs;
                          if (statusCode.Token != '') {
                            for (int l = 0;
                                l <
                                    controller[idcategory.value]
                                        .subCategories[indexsup]
                                        .products
                                        .length;
                                l++) {
                              pricesup += controller[idcategory.value]
                                      .subCategories[indexsup]
                                      .products[l]
                                      .price *
                                  controller[idcategory.value]
                                      .subCategories[indexsup]
                                      .products[l]
                                      .Cartid[0]
                                      .quantity;
                            }
                          } else {
                            if (cartscounte.length != 0) {
                              for (int l = 0;
                                  l <
                                      controller[idcategory.value]
                                          .subCategories[indexsup]
                                          .products
                                          .length;
                                  l++) {
                                idcategory.value == 0
                                    ? pricesup += controller[idcategory.value]
                                            .subCategories[indexsup]
                                            .products[l]
                                            .price *
                                        cartscounte[l]
                                    : pricesup += controller[idcategory.value]
                                            .subCategories[indexsup]
                                            .products[l]
                                            .price *
                                        cartscounte[
                                            controller[idcategory.value - 1]
                                                    .subCategories[indexsup]
                                                    .products
                                                    .length +
                                                l];
                              }
                            }
                          }
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  color: AppColors.lightgrey2Color,
                                  child: ExpansionTile(
                                    leading: Image.network(
                                      statusCode.urlimage +
                                          controller[idcategory.value]
                                              .subCategories[indexsup]
                                              .icon!,
                                      color: AppColors.mainColor,
                                      width: 20,
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(controller[idcategory.value]
                                            .subCategories[indexsup]
                                            .name!),
                                        Row(
                                          children: [
                                            Text('${pricesup.value} \$'),
                                            IconButton(
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                DialogsUtils.showdialogConfirm(
                                                  m: 'Proceed ?',
                                                  onPressedCancel: () {
                                                    Get.back();
                                                  },
                                                  onPressedOk: () {
                                                    Get.back();
                                                  },
                                                );
                                              },
                                              icon: Image.asset(
                                                'assets/png/remove.png',
                                                width: 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    onExpansionChanged: (b) {
                                      idsupcategory.value = indexsup;
                                      b
                                          ? Get.bottomSheet(
                                              Container(
                                                padding: EdgeInsets.all(
                                                    Defaults.defaultPadding),
                                                height: size.height * 0.40,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColors.greyColor
                                                          .withOpacity(0.3),
                                                      offset: Offset(0, -2),
                                                      blurRadius: 5,
                                                      spreadRadius: 2,
                                                    )
                                                  ],
                                                ),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: ListProdCart(
                                                        controlleritem:
                                                            controller[
                                                                    idcategory
                                                                        .value]
                                                                .subCategories[
                                                                    idsupcategory
                                                                        .value]
                                                                .products,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            flex: 7,
                                                            child: ButtonUpdate(
                                                                size: size),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                ButtonScroll(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : null;
                                    },
                                  ),
                                ),
                                Divider(
                                  height: 0,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                  color: Colors.grey,
                                ),
                              ]);
                        }),
                  )
                ],
              ),
            );
          }),
    );
  }
}
