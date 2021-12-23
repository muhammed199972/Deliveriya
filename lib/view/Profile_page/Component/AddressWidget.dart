import 'package:delivery_food/General/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressWidget extends StatelessWidget {
  AddressWidget(
      {Key? key,
      required this.size,
      required this.icon,
      required this.icondel,
      this.subtitle,
      required this.txt})
      : super(key: key);

  final Size size;
  Widget? icon;
  Widget? icondel;
  String? subtitle;
  String? txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.080,
      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
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
            icon!,
            SizedBox(
              width: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(txt!),
                Text(subtitle!),
              ],
            ),
          ],
        ),
        trailing: icondel,
      ),
    );
  }
}
