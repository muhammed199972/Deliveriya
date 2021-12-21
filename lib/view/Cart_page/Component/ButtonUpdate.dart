import 'package:delivery_food/General/Constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Constansbox.box.write('cartscounte', prodController.cartsupdate);
        prodController.cartscounte = Constansbox.box.read('cartscounte');
        List<dynamic> cart = prodController.cartsid;
        List<int> carts = [];
        cart.forEach((e) => carts.add(e));
        Get.offAll(
          BottomBar(
            intid: 0,
            fu: HomeView(),
          ),
        );
        //  CartView();

        //  Get.back();
        prodController.getListproduct(
            Listproduct: carts, q: '', from: '', to: '');
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
