import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubcategoryFavorite extends StatelessWidget {
  SubcategoryFavorite({
    Key? key,
    this.favoriteController,
    required this.size,
  }) : super(key: key);
  var favoriteController;
  final Size size;
  var fav = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: size.height * 0.0293,
      width: double.infinity,
      margin: EdgeInsets.only(left: size.width * 0.0245),
      child: ListView.builder(
          itemCount: favoriteController.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            bool even_or_odd = true;
            if ((index % 2) == 0) {
              even_or_odd = false;
            }

            return Container(
                height: size.height * 0.0293,
                width: even_or_odd ? size.width * 0.3405 : size.width * 0.2189,
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
                        fav.idsupcategory.value = index;
                        // subController.changevalue(
                        //     subController.subcategorys[index].id!);
                        // prodController.getproduct(
                        //     subCategoryId:
                        //         '${subController.subcategorys[index].id!}',
                        //     offset: 0,
                        //     limit: 8,
                        //     q: '');
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
                              child: Text(
                                favoriteController[index].name.toString(),
                                style: TextStyle(
                                    color: fav.idsupcategory.value == index
                                        ? AppColors.mainColor
                                        : AppColors.darkgreytextColor,
                                    fontSize: size.width >= 600 ? 25 : 16),
                              ),
                            ),
                          ]),
                    );
                  },
                ));
          }),
    );
  }
}
