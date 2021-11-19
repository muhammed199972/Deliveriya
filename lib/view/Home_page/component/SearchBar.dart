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
