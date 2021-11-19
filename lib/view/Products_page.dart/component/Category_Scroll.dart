import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Category_controller.dart';
import 'package:delivery_food/controller/Subcategory_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorysScroll extends StatelessWidget {
  CategorysScroll({
    Key? key,
    this.idcategory,
    this.subcategory,
    required this.size,
  }) : super(key: key);

  final Size size;
  int? idcategory;
  var subcategory;
  @override
  Widget build(BuildContext context) {
    CategorysController category = Get.put(CategorysController());
    print(size.height);
    print(size.width);

    return new Container(
      color: Colors.transparent,
      height: size.height * 0.0586,
      width: double.infinity,
      margin: EdgeInsets.only(
          top: size.height * 0.0147,
          left: size.width * 0.0245,
          bottom: size.height * 0.0147),
      child: ListView.builder(
          itemCount: category.categorys.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: size.height * 0.0586,
              width: size.width * 0.2189,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(2, 5),
                  ),
                ],
              ),
              margin:
                  EdgeInsets.symmetric(horizontal: Defaults.defaultPadding / 6),
              child: Obx(() {
                return InkWell(
                    onTap: () {
                      category.changevalue(category.categorys[index].id!);
                      subcategory.getsubcategory(category.categorys[index].id!);
                    },
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/png/Meat icon.png',
                              color: category.value.value ==
                                      category.categorys[index].id
                                  ? AppColors.mainColor
                                  : AppColors.greyColor,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              category.categorys[index].name.toString(),
                              style: TextStyle(
                                color: category.value.value ==
                                        category.categorys[index].id
                                    ? AppColors.mainColor
                                    : AppColors.greyColor,
                              ),
                            ),
                          ),
                        ]));
              }),
            );
          }),
    );
  }
}
