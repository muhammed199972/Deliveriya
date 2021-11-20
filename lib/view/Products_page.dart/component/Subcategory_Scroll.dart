import 'package:delivery_food/General/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubcategoryScroll extends StatelessWidget {
  SubcategoryScroll({
    Key? key,
    this.subcategory,
    required this.size,
  }) : super(key: key);

  final Size size;
  var subcategory;
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: size.height * 0.0293,
      width: double.infinity,
      margin: EdgeInsets.only(left: size.width * 0.0245),
      child: Obx(() {
        return ListView.builder(
            itemCount: subcategory.subcategorys.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              bool even_or_odd = true;
              if ((index % 2) == 0) {
                even_or_odd = false;
              }
              return Obx(() {
                return Container(
                    height: size.height * 0.0293,
                    width:
                        even_or_odd ? size.width * 0.3405 : size.width * 0.2189,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      border: Border.all(
                        color: subcategory.value.value == index
                            ? AppColors.mainColor
                            : AppColors.greyColor,
                        width: 1,
                      ),
                    ),
                    margin: EdgeInsets.only(
                        left: Defaults.defaultPadding / 4,
                        right: Defaults.defaultPadding / 1.5),
                    child: Obx(
                      () {
                        return InkWell(
                          onTap: () {
                            subcategory.changevalue(index);
                          },
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    subcategory.subcategorys[index].name
                                        .toString(),
                                    style: TextStyle(
                                      color: subcategory.value.value == index
                                          ? AppColors.mainColor
                                          : AppColors.greyColor,
                                    ),
                                  ),
                                ),
                              ]),
                        );
                      },
                    ));
              });
            });
      }),
    );
  }
}
