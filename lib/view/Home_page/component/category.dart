import 'package:delivery_food/controller/Category_controller.dart';
import 'package:delivery_food/controller/Subcategory_controller.dart';
import 'package:delivery_food/model/Category_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Category extends StatelessWidget {
  final Subcategorys categorys = Get.put(Subcategorys());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: Obx(() {
          if (categorys.subcategorys.length != 0) {
            print(categorys.subcategorys[0].name.toString());

            return ListView.builder(
              itemCount: categorys.subcategorys.length,
              itemBuilder: (context, index) {
                return Container(
                    child: Text(categorys.subcategorys[index].name.toString()));
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
