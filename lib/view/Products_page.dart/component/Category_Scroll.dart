import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Category_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/controller/Subcategory_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorysScroll extends StatelessWidget {
  CategorysScroll({
    Key? key,
    this.iSfavorite,
    required this.size,
  }) : super(key: key);
  StatusCode statusCode = StatusCode();

  final Size size;
  bool? iSfavorite;
  CategorysController category = Get.find<CategorysController>();
  var subController = Get.find<SubcategorysControllers>();
  var prodController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.transparent,
      height: iSfavorite! ? size.height : size.height * 0.065,
      width: iSfavorite! ? size.width / 3.2 : double.infinity,
      margin: EdgeInsets.only(
        top: size.height * 0.0147,
        left: size.width * 0.0245,
      ),
      child: Obx(() {
        return ListView.builder(
            controller: category.controllerList.value,
            itemCount: category.categorys.length,
            // padding: EdgeInsets.only(bottom: size.height),
            scrollDirection: iSfavorite! ? Axis.vertical : Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: size.height * 0.1,
                width: size.width * 0.26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.1),
                  //     spreadRadius: 1,
                  //     blurRadius: 10,
                  //     offset: Offset(2, 5),
                  //   ),
                  // ],
                  border: Border.all(
                    color: AppColors.darkgreyColor,
                    width: 1.5,
                  ),
                ),
                margin: iSfavorite!
                    ? EdgeInsets.symmetric(
                        vertical: Defaults.defaultPadding / 5)
                    : EdgeInsets.symmetric(
                        horizontal: Defaults.defaultPadding / 6),
                padding: EdgeInsets.all(5),
                child: Obx(() {
                  return InkWell(
                      onTap: () async {
                        category.changevalue(category.categorys[index].id!);
                        await subController
                            .getsubcategory(category.categorys[index].id!);
                        prodController.offsetScroll = 0;
                        prodController.subcategoryId =
                            subController.idsub.value;
                        prodController.getproduct(
                            subCategoryId: '${subController.idsub.value}',
                            offset: 0,
                            limit: 16,
                            q: '');
                      },
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.network(
                                statusCode.urlimage +
                                    category.categorys[index].icon!,
                                // color: category.value.value ==
                                //         category.categorys[index].id
                                //     ? AppColors.mainColor
                                //     : AppColors.darkgreytextColor,
                                scale: size.width >= 600 ? 0.5 : 1,
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  category.categorys[index].name.toString(),
                                  style: TextStyle(
                                    fontSize: size.width >= 600 ? 25 : 16,
                                    color: category.value.value ==
                                            category.categorys[index].id
                                        ? AppColors.mainColor
                                        : AppColors.darkgreytextColor,
                                  ),
                                ),
                              ),
                            ),
                          ]));
                }),
              );
            });
      }),
    );
  }
}
