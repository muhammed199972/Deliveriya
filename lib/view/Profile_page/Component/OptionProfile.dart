import 'package:delivery_food/General/Constants.dart';
import 'package:flutter/material.dart';

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
        height: size.height * 0.065,
        margin: EdgeInsets.symmetric(horizontal: padd ?? 17, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkgreyColor.withOpacity(0.2),
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 1,
              )
            ]),
        child: ListTile(
            title: Row(
              children: [
                icon ?? Container(),
                icon != null
                    ? SizedBox(
                        width: 8,
                      )
                    : Container(),
                Text(
                  txt!,
                  style: size.width >= 600
                      ? Styles.defualttab
                      : Styles.defualtmobile,
                ),
              ],
            ),
            trailing: iconarrow!),
      ),
    );
  }
}
