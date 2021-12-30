import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/view/Home_page/component/SearchDelegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        showSearch(context: context, delegate: Datasesrch());
      },
      child: Container(
          height: size.height * 0.035,
          padding: EdgeInsets.symmetric(
            horizontal: Defaults.defaultPadding,
          ),
          margin: EdgeInsets.symmetric(horizontal: Defaults.defaultPadding),
          decoration: BoxDecoration(
            color: AppColors.lightmainColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.lightgreyColor,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width > 350 ? 250 : 220.0,
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: AppColors.darkgreytextColor,
                    fontSize: size.width >= 600 ? 30 : 15.0,
                    fontFamily: 'Roboto',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('searchhelper'.tr,
                          speed: const Duration(milliseconds: 100)),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              Icon(
                Icons.search,
                color: AppColors.darkgreytextColor,
                size: size.width >= 600 ? 30 : 15,
              )
            ],
          )),
    );
  }
}
