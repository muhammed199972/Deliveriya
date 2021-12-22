import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProdCart extends StatelessWidget {
  ListProdCart({
    Key? key,
    required this.item,
  }) : super(key: key);

  var item = [];
  var prodController = Get.find<ProductsController>();

  var cart = Get.put(CartController());
  StatusCode statusCode = StatusCode();

  @override
  Widget build(BuildContext context) {
    List controlleritem = [].obs;
    item.forEach((element) {
      controlleritem.add(element);
    });
    prodController.cartscountupdate = [];
    prodController.cartsdeleteupdate = [];

    return Obx(() {
      cart.updata = [];

      return ListView.builder(
          controller: cart.listScrollController,
          itemCount: controlleritem.length,
          itemBuilder: (context, index) {
            var counter = 0.obs;
            int? ind;
            if (statusCode.Token != '') {
              cart.updata.add({
                'productId': controlleritem[index].id,
                'quantity': controlleritem[index].Cartid[0].quantity
              });
              counter.value = controlleritem[index].Cartid[0].quantity;
            } else {
              for (int u = 0; u < prodController.cartsid.length; u++) {
                if (controlleritem[index].id == prodController.cartsid[u]) {
                  ind = u;
                  break;
                }
              }
              List cartscounte = prodController.cartscounte;
              List cartsid = prodController.cartsid;

              prodController.cartscountupdate = prodController.cartscounte;
              prodController.cartsdeleteupdate = prodController.cartsid;
              counter.value = cartscounte[ind!];
            }
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.network(
                        statusCode.urlimage + controlleritem[index].avatar,
                        width: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(controlleritem[index].name),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (counter > 0) {
                            counter--;
                            if (statusCode.Token == '') {
                              prodController.cartscountupdate[ind!]--;
                            } else {
                              cart.updata[index]['quantity'] =
                                  cart.updata[index]['quantity']! - 1;
                            }
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
                                blurRadius: 2,
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
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Obx(() {
                          return Center(
                            child: Text('${counter.value}'),
                          );
                        }),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          counter++;

                          if (statusCode.Token == '') {
                            prodController.cartscountupdate[ind!]++;
                          } else {
                            cart.updata[index]['quantity'] =
                                cart.updata[index]['quantity']! + 1;
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
                    ],
                  ),
                  Row(
                    children: [
                      Obx(() {
                        return FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Container(
                            width: 52,
                            child: Text(
                                '${controlleritem[index].price * counter.value} \$'),
                          ),
                        );
                      }),
                      IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          DialogsUtils.showdialogdelete(
                              m: 'Proceed ?',
                              onPressedCancel: () {
                                Get.back();
                              },
                              onPressedOk: () {
                                if (statusCode.Token == '') {
                                  var item = controlleritem;
                                  item.removeAt(index);
                                  prodController.cartscountupdate
                                      .removeAt(ind!);
                                  prodController.cartsdeleteupdate
                                      .removeAt(ind);
                                  ListProdCart(
                                    item: item,
                                  );
                                } else {
                                  var item = controlleritem;
                                  cart.updatadelete.add(item[index].id);
                                  item.removeAt(index);
                                  ListProdCart(
                                    item: item,
                                  );
                                  Get.back();
                                }
                              });
                        },
                        icon: Image.asset(
                          'assets/png/remove.png',
                          width: 50,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          });
    });
  }
}
