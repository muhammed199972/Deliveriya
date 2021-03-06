import 'package:bot_toast/bot_toast.dart';
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
    Size size = MediaQuery.of(context).size;

    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () async {
        try {
          BotToast.showLoading();
          controller.changevalue(datacontroller.id!);
          controller.changecontrollerscroll(index);
          await subcategory.getsubcategory(datacontroller.id);
          prodController.offsetScroll = 0;
          prodController.subcategoryId = subcategory.subcategorys[0].id!;
          prodController.getproduct(
              subCategoryId: '${subcategory.subcategorys[0].id}',
              offset: 0,
              limit: 16,
              q: '');
          Get.offAll(() => BottomBar(
              intid: 2,
              fu: ProduvtsView(
                idcategory: datacontroller.id,
              )));
        } finally {
          BotToast.closeAllLoading();
        }

        // ProduvtsView(
        //       idcategory: datacontroller.id,
        //     ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.darkgreyColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                statusCode.urlimage + datacontroller.icon,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(Defaults.defaultPadding / 2 - 5),
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      datacontroller.name,
                      style: size.width >= 600
                          ? Styles.defualttab
                          : Styles.defualtmobile,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
