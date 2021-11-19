import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Category_controller.dart';
import 'package:delivery_food/controller/Subcategory_controller.dart';
import 'package:delivery_food/model/Category_model.dart';
import 'package:delivery_food/view/Products_page.dart/Products_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorysCard extends StatelessWidget {
  CategorysCard({
    Key? key,
    this.datacontroller,
    this.controller,
  }) : super(key: key);

  var datacontroller;
  var controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        controller.changevalue(datacontroller.id!);
        ControllerSubcategorys subcategory = Get.put(ControllerSubcategorys());
        subcategory.getsubcategory(datacontroller.id);
        //subcategory.changevalue(datacontroller.id!);
        Get.to(() => ProduvtsView(
              subcategory: subcategory,
              idcategory: datacontroller.id,
            ));
      },
      child: new Container(
        margin: EdgeInsets.symmetric(horizontal: Defaults.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: AppColors.mainColor,
                    width: 2,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(datacontroller.avatar),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(Defaults.defaultPadding / 2 - 5),
                child: Text(datacontroller.name),
              ),
            )
          ],
        ),
      ),
    );
  }
}
