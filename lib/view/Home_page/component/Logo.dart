import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/view/Home_page/component/Statuses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_animation/ripple_animation.dart';

class LogoStatus extends StatelessWidget {
  const LogoStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        Get.to(() => Statuses(
              typeclass: 'logo',
            ));
      },
      child: RippleAnimation(
        repeat: true,
        color: AppColors.mainColor,
        minRadius: 40,
        ripplesCount: 4,
        duration: const Duration(milliseconds: 2500),
        delay: const Duration(milliseconds: 1),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: 1,
              image: AssetImage('assets/png/logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
