import 'package:delivery_food/General/Constants.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: Defaults.defaultPadding),
      child: Row(
        children: [
          Text('Total price :'),
          Spacer(),
          Center(
            child: Text('25000 \$'),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
