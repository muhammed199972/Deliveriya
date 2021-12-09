import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/view/Cart_page/Component/Categor_Sub_Cart.dart';
import 'package:delivery_food/view/Cart_page/Component/TotalPrice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);
  var controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_rounded,
          color: AppColors.blackColor,
        ),
        title: Center(
          child: Text(
            'Cart',
            style: TextStyle(color: AppColors.blackColor),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/png/hestory.png',
                width: 40,
              )),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/png/background.png'),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: CategoryCart(size: size, controller: controller),
            ),
            Expanded(child: TotalPrice())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        splashColor: AppColors.lightmainColor,
        backgroundColor: AppColors.mainColor,
        child: Text('Submit'),
      ),
    );
  }
}
