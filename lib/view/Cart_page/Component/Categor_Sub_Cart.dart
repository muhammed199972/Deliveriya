import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/view/Cart_page/Component/ButtonScroll.dart';
import 'package:delivery_food/view/Cart_page/Component/ButtonUpdate.dart';
import 'package:delivery_food/view/Cart_page/Component/ListProducts_Cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCart extends StatelessWidget {
  const CategoryCart({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          var visibleRemove = false.obs;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
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
              leading: Image.asset(
                'assets/png/logo.png',
                width: 40,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('Grocery'),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text('55 \$'),
                        Obx(
                          () => Visibility(
                            visible: visibleRemove.value,
                            child: IconButton(
                              splashColor: Colors.transparent,
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/png/remove.png',
                                scale: 0.8,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              onExpansionChanged: (p) {
                visibleRemove.value = p;
              },
              children: [
                Container(
                  color: AppColors.lightgrey2Color,
                  child: ExpansionTile(
                    leading: Image.asset(
                      'assets/png/logo.png',
                      width: 40,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Grocery'),
                        Row(
                          children: [
                            Text('55 \$'),
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
                      b
                          ? Get.bottomSheet(
                              Container(
                                padding:
                                    EdgeInsets.all(Defaults.defaultPadding),
                                height: size.height * 0.40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.greyColor.withOpacity(0.3),
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
                                      child:
                                          ListProdCart(controller: controller),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 7,
                                            child: ButtonUpdate(size: size),
                                          ),
                                          Expanded(
                                            child: ButtonScroll(
                                                controller: controller),
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
              ],
            ),
          );
        });
  }
}
