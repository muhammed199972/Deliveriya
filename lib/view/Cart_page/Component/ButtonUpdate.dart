import 'package:delivery_food/General/Constants.dart';
import 'package:flutter/material.dart';

class ButtonUpdate extends StatelessWidget {
  const ButtonUpdate({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.054,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkgreytextColor.withOpacity(0.3),
            offset: Offset(0, 1),
            blurRadius: 3,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Update',
        ),
      ),
    );
  }
}
