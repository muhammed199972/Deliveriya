import 'package:delivery_food/view/Home_page/component/Statuses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoStatus extends StatelessWidget {
  const LogoStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => Statuses());
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            scale: 1,
            image: AssetImage('assets/png/logo.png'),
          ),
        ),
      ),
    );
  }
}
