import 'package:delivery_food/General/Constants.dart';
import 'package:flutter/material.dart';

class Button_category_search extends StatefulWidget {
  String? name;

  Button_category_search(this.name);

  @override
  State<StatefulWidget> createState() {
    return _Button_category_search();
  }
}

class _Button_category_search extends State<Button_category_search> {
  Constans CategorySelected = Constans();
  bool Selected = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          widget.name!,
          style: TextStyle(fontSize: 20),
        ),
      ),
      backgroundColor: !Selected ? Colors.grey[300] : AppColors.mainColor,
      //  shape: StadiumBorder(side: BorderSide()),
      onSelected: (bool value) {
        setState(() {
          Selected ? Selected = false : Selected = true;
          Selected
              ? CategorySelected.categorySelected.remove(widget.name!)
              : CategorySelected.categorySelected.add(widget.name!);
        });
      },
    );
  }
}
