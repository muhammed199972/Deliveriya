import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/view/Home_page/component/SearchDelegate.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: AppColors.darkgreytextColor,
                    fontSize: 15.0,
                    fontFamily: 'Roboto',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('How can we help you ...',
                          speed: const Duration(milliseconds: 100)),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              Icon(Icons.search, color: AppColors.darkgreytextColor)
            ],
          )),
    );
  }
}
