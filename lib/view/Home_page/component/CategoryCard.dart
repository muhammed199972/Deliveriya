import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Category_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/controller/Subcategory_controller.dart';
import 'package:delivery_food/view/Products_page.dart/Products_page.dart';
import 'package:delivery_food/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorysCard extends StatelessWidget {
  CategorysCard({Key? key, this.datacontroller, this.index}) : super(key: key);

  var datacontroller;
  var index;
  SubcategorysControllers subcategory = Get.find<SubcategorysControllers>();
  CategorysController controller = Get.find<CategorysController>();
  var prodController = Get.find<ProductsController>();
  StatusCode statusCode = StatusCode();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () async {
        controller.changevalue(datacontroller.id!);
        controller.changecontrollerscroll(index);
        await subcategory.getsubcategory(datacontroller.id);
        prodController.getproduct(
            subCategoryId: '${subcategory.subcategorys[0].id}',
            offset: 0,
            limit: 8,
            q: '');
        Get.back();
        Get.to(() => BottomBar(
                fu: ProduvtsView(
              idcategory: datacontroller.id,
            )));
        // ProduvtsView(
        //       idcategory: datacontroller.id,
        //     ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.greyColor,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                statusCode.urlimage + datacontroller.avatar,
                fit: BoxFit.contain,
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
