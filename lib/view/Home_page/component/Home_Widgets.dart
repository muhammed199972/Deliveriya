import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/view/Home_page/component/Statuses.dart';
import 'package:delivery_food/view/Home_page/component/search.dart';
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

class Offers_New extends StatelessWidget {
  const Offers_New({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: Defaults.defaultPadding,
              right: Defaults.defaultPadding / 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Offers'),
                ),
                Container(
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      color: AppColors.mainColor,
                      width: 1,
                    ),
                    // image: DecorationImage(
                    //   fit: BoxFit.cover,
                    //   image: NetworkImage(controller.categorys[index].avatar!),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              right: Defaults.defaultPadding,
              left: Defaults.defaultPadding / 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('New'),
                ),
                Container(
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      color: AppColors.mainColor,
                      width: 1,
                    ),
                    // image: DecorationImage(
                    //   fit: BoxFit.cover,
                    //   image: NetworkImage(controller.categorys[index].avatar!),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
            color: AppColors.mainColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.greyColor,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search',
                style: TextStyle(color: AppColors.greyColor),
              ),
              Icon(Icons.search, color: AppColors.greyColor)
            ],
          )),
    );
  }
}
