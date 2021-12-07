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
      child: Padding(
        padding: const EdgeInsets.only(top: Defaults.defaultPadding),
        child: Stack(
          children: [
            RippleAnimation(
              repeat: true,
              color: AppColors.mainColor,
              minRadius: 35,
              ripplesCount: 7,
              duration: const Duration(milliseconds: 3000),
              delay: const Duration(milliseconds: 5),
              child: Container(),
            ),
            Center(
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset('assets/png/logo.png'))),
          ],
        ),
      ),
    );
  }
}
