import 'package:delivery_food/controller/Subcategory_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  final ControllerSubcategorys categorys = Get.put(ControllerSubcategorys());

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
