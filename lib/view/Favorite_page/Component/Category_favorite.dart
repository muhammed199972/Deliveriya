import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorysFavorite extends StatelessWidget {
  CategorysFavorite({
    Key? key,
    this.favoriteController,
    required this.size,
  }) : super(key: key);
  var fav = Get.find<FavoriteController>();
  StatusCode statusCode = StatusCode();
  final Size size;
  var favoriteController;
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.transparent,
      height: size.height,
      width: size.width / 3.2,
      margin: EdgeInsets.only(
        top: size.height * 0.0147,
        left: size.width * 0.0245,
      ),
      child: Obx(() {
        return ListView.builder(
            itemCount: favoriteController.length,
            // padding: EdgeInsets.only(bottom: size.height),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: size.height * 0.0586,
                width: size.width * 0.28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(2, 5),
                    ),
                  ],
                  border: Border.all(
                    color: AppColors.darkgreyColor,
                    width: 1.5,
                  ),
                ),
                margin:
                    EdgeInsets.symmetric(vertical: Defaults.defaultPadding / 5),
                padding: EdgeInsets.all(5),
                child: Obx(() {
                  return InkWell(
                      onTap: () async {
                        fav.idcategory.value = index;
                        // category.changevalue(category.categorys[index].id!);
                        // await subController
                        //     .getsubcategory(category.categorys[index].id!);
                        // prodController.getproduct(
                        //     subCategoryId: '${subController.value}',
                        //     offset: 0,
                        //     limit: 8,
                        //     q: '');
                      },
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.network(
                                statusCode.urlimage +
                                    favoriteController[index].icon!,
                                color: fav.idcategory.value == index
                                    ? AppColors.mainColor
                                    : AppColors.darkgreytextColor,
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  favoriteController[index].name.toString(),
                                  style: TextStyle(
                                      color: fav.idcategory.value == index
                                          ? AppColors.mainColor
                                          : AppColors.darkgreytextColor,
                                      fontSize: size.width >= 600 ? 25 : 16),
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
