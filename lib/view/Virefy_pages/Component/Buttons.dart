import 'package:delivery_food/General/Constants.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    Key? key,
    required this.size,
    required this.txt,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  String? txt;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Defaults.defaultPadding / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.mainColor,
        ),
        width: size.width,
        height: 40,
        child: Center(
            child: Text(
          txt!,
          style: Styles.buttonStyle2,
        )),
      ),
    );
  }
}

class ButtonWidget2 extends StatelessWidget {
  ButtonWidget2({
    Key? key,
    required this.size,
    required this.txt,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  String? txt;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Defaults.defaultPadding / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.mainColor, width: 1),
        ),
        width: size.width,
        height: 40,
        child: Center(
            child: Text(
          txt!,
          style: Styles.buttonStyle,
        )),
      ),
    );
  }
}
