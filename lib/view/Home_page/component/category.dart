import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryComponent extends StatelessWidget {
  CategorysController categorys =
      Get.put(CategorysController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categorys.categorys.length != 0) {
        print(categorys.categorys[0].name.toString());

        return ListView.builder(
          itemCount: categorys.categorys.length,
          itemBuilder: (context, index) {
            return Container(
                child: Text(categorys.categorys[index].name.toString()));
          },
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
