import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonScroll extends StatelessWidget {
  const ButtonScroll({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.changecontrollerscroll();
      },
      icon: Obx(() => Icon(
            Icons.keyboard_arrow_down_outlined,
            color: controller.maxscroll.value
                ? AppColors.darkgreytextColor
                : AppColors.mainColor,
            size: 25,
          )),
    );
  }
}
