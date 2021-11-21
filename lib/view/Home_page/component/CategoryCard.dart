import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Category_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/controller/Subcategory_controller.dart';
import 'package:delivery_food/view/Products_page.dart/Products_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorysCard extends StatelessWidget {
  CategorysCard({Key? key, this.datacontroller, this.index}) : super(key: key);

  var datacontroller;
  var index;
  SubcategorysControllers subcategory = Get.find<SubcategorysControllers>();
  CategorysController controller = Get.find<CategorysController>();
  var prodController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        controller.changevalue(datacontroller.id!);
        controller.changecontrollerscroll(index);
        subcategory.getsubcategory(datacontroller.id);
        prodController.getproduct(
            subCategoryId: '${subcategory.value}', offset: 0, limit: 8, q: '');

        Get.to(() => ProduvtsView(
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
