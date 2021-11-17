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

class CategorysCard extends StatelessWidget {
  CategorysCard({
    this.name,
    this.img,
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CategorysController controller;
  String? img;
  String? name;
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: Defaults.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColors.mainColor,
                  width: 2,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(img!),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Defaults.defaultPadding / 2 - 5),
              child: Text(name!),
            ),
          )
        ],
      ),
    );
  }
}
