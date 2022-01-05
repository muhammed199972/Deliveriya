import 'package:delivery_food/General/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class OptionProfile extends StatelessWidget {
  OptionProfile(
      {Key? key,
      required this.size,
      this.icon,
      this.iconarrow,
      required this.ontap,
      required this.txt,
      this.padd})
      : super(key: key);

  final Size size;
  Widget? icon;
  Widget? iconarrow;
  String? txt;
  double? padd;
  void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: ontap,
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: padd ?? 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    icon ?? Container(),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      txt ?? '',
                      style: size.width >= 600
                          ? Styles.defualttab
                          : Styles.defualtmobile,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.darkgreytextColor.withOpacity(0.5),
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
