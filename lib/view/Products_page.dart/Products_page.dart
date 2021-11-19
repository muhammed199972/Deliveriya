import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Category_controller.dart';
import 'package:delivery_food/view/Home_page/component/CategoryCard.dart';
import 'package:delivery_food/view/Home_page/component/Logo.dart';
import 'package:delivery_food/view/Home_page/component/Offers_New.dart';
import 'package:delivery_food/view/Home_page/component/SearchBar.dart';
import 'package:delivery_food/view/Products_page.dart/component/Category_Scroll.dart';
import 'package:delivery_food/view/Products_page.dart/component/Subcategory_Scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ProduvtsView extends StatelessWidget {
  int? idcategory;
  var subcategory;
  ProduvtsView({this.idcategory, this.subcategory});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Produvts",
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Color(0xFFE7D9EA)),
        ),
      ),
      body: ListView(
        children: [
          CategorysScroll(
            size: size,
            idcategory: idcategory,
            subcategory: subcategory,
          ),
          SubcategoryScroll(
            size: size,
            subcategory: subcategory,
          ),
        ],
      ),
    );
  }
}
