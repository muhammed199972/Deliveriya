import 'package:delivery_food/General/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldProfwidget extends StatelessWidget {
  TextFieldProfwidget({
    Key? key,
    required this.controller,
    required this.lebel,
    this.icon,
    this.prefixtxt,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
    this.suffixPressed,
    this.ispassword,
    this.txttype,
    this.lines,
    this.h,
  });

  TextEditingController controller;
  String? lebel;
  String? prefixtxt;
  Widget? icon;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  IconData? suffixIcon;
  bool? ispassword = false;
  VoidCallback? suffixPressed;
  TextInputType? txttype;
  double? h;
  int? lines;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: h ?? 50,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: TextFormField(
        validator: validator,
        //Text Field which accepts input.

        inputFormatters: inputFormatters,
        keyboardType: txttype,
        maxLines: lines ?? 1,
        decoration: InputDecoration(
          fillColor: AppColors.whiteColor.withOpacity(0.5),
          filled: true,
          floatingLabelStyle: TextStyle(color: AppColors.mainColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainColor, width: 1.0),
          ),
          prefixIcon: icon,
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          prefixText: prefixtxt,
          labelText: lebel,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          suffixIcon: suffixIcon != null
              ? IconButton(icon: Icon(suffixIcon), onPressed: suffixPressed)
              : null,
        ),
        controller: controller,
        obscureText: ispassword ?? false,
      ),
    );
  }
}
