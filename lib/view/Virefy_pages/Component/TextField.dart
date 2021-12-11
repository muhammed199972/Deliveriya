import 'package:delivery_food/General/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldwidget extends StatelessWidget {
  TextFieldwidget({
    Key? key,
    required this.controller,
    required this.lebel,
    required this.icon,
    this.prefixtxt,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
    this.suffixPressed,
    this.ispassword,
    this.txttype,
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
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      //Text Field which accepts input.

      inputFormatters: inputFormatters,
      keyboardType: txttype,
      decoration: InputDecoration(
        fillColor: AppColors.lightgreyColor.withOpacity(0.5),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(icon: Icon(suffixIcon), onPressed: suffixPressed)
            : null,
      ),
      controller: controller,
      obscureText: ispassword ?? false,
    );
  }
}
