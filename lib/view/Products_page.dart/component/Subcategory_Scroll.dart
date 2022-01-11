import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/controller/Subcategory_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubcategoryScroll extends StatelessWidget {
  SubcategoryScroll({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  var subController = Get.find<SubcategorysControllers>();
  var prodController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: size.height * 0.0293,
      width: double.infinity,
      margin: EdgeInsets.only(left: size.width * 0.0245),
      child: Obx(() {
        return ListView.builder(
            itemCount: subController.subcategorys.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              bool even_or_odd = true;
              if ((index % 2) == 0) {
                even_or_odd = false;
              }

              return Container(
                  height: size.height * 0.0293,
                  width:
                      even_or_odd ? size.width * 0.3405 : size.width * 0.2189,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.darkgreyColor,
                      width: 1.5,
                    ),
                  ),
                  margin: EdgeInsets.only(
                      left: Defaults.defaultPadding / 4,
                      right: Defaults.defaultPadding / 1.5),
                  child: Obx(
                    () {
                      return InkWell(
                        onTap: () {
                          subController.changevalue(
                              subController.subcategorys[index].id!);
                          prodController.offsetScroll = 0;
                          prodController.subcategoryId =
                              subController.subcategorys[index].id!;
                          prodController.getproduct(
                              subCategoryId:
                                  '${subController.subcategorys[index].id!}',
                              offset: 0,
                              limit: 16,
                              q: '');
                          // prodController.getproduct(
                          //     subCategoryId: index.toString(),
                          //     offset: 0,
                          //     limit: 8,
                          //     q: '');
                        },
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    subController.subcategorys[index].name
                                        .toString(),
                                    style: TextStyle(
                                        color: subController.idsub.value ==
                                                subController
                                                    .subcategorys[index].id
                                            ? AppColors.mainColor
                                            : AppColors.darkgreytextColor,
                                        fontSize: size.width >= 600 ? 25 : 16),
                                  ),
                                ),
                              ),
                            ]),
                      );
                    },
                  ));
            });
      }),
    );
  }
}
