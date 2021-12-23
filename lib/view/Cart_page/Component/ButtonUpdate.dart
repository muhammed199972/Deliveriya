import 'dart:convert';

import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/view/Cart_page/Cart_Page.dart';
import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:delivery_food/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonUpdate extends StatelessWidget {
  ButtonUpdate({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  var prodController = Get.find<ProductsController>();
  StatusCode statusCode = StatusCode();
  var cart = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (statusCode.Token == '') {
          Constansbox.box.write('cartscounte', prodController.cartscountupdate);
          prodController.cartscounte = Constansbox.box.read('cartscounte');

          Constansbox.box.write('cartsid', prodController.cartsdeleteupdate);
          prodController.cartsid = Constansbox.box.read('cartsid');

          List<dynamic> cart = prodController.cartsid;
          List<int> carts = [];
          cart.forEach((e) => carts.add(e));
          Get.offAll(
            BottomBar(
              intid: 0,
              fu: HomeView(),
            ),
          );

          prodController.getListproduct(
              Listproduct: carts, q: '', from: '', to: '');
        } else {
          if (cart.updatadelete.length == 0 && cart.updata.length == 0) {
            // Get.back();
          } else if (cart.updatadelete.length == 0) {
            Map body = {"ids": cart.updata};
            // Get.back();
            cart.patchcart(body);
          } else if (cart.updata.length == 0) {
            Map body = {"deleteIds": cart.updatadelete};
            // Get.back();
            cart.patchcart(body);
          } else {
            Map body = {"ids": cart.updata, "deleteIds": cart.updatadelete};
            // Get.back();
            cart.patchcart(body);
          }
        }
      },
      child: Container(
        height: size.height * 0.054,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkgreytextColor.withOpacity(0.3),
              offset: Offset(0, 1),
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Update',
          ),
        ),
      ),
    );
  }
}
