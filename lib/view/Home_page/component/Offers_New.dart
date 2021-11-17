import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/view/Home_page/component/Statuses.dart';
import 'package:delivery_food/view/Home_page/component/SearchDelegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
