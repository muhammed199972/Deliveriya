import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Category_controller.dart';
import 'package:delivery_food/view/Home_page/component/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'component/Statuses.dart';

class HomeView extends StatelessWidget {
  CategorysController controller = Get.put(CategorysController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.to(() => Statuses());
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      scale: 1,
                      // fit: BoxFit.contain,
                      image: AssetImage('assets/png/logo.png'),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showSearch(context: context, delegate: Datasesrch());
              },
              child: Container(
                  height: size.height * 0.035,
                  padding: EdgeInsets.symmetric(
                    horizontal: Defaults.defaultPadding,
                  ),
                  margin:
                      EdgeInsets.symmetric(horizontal: Defaults.defaultPadding),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColors.greyColor,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search',
                        style: TextStyle(color: AppColors.greyColor),
                      ),
                      Icon(Icons.search, color: AppColors.greyColor)
                    ],
                  )),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: Defaults.defaultPadding,
                      right: Defaults.defaultPadding / 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Offers'),
                        ),
                        Container(
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                              color: AppColors.mainColor,
                              width: 1,
                            ),
                            // image: DecorationImage(
                            //   fit: BoxFit.cover,
                            //   image: NetworkImage(controller.categorys[index].avatar!),
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: Defaults.defaultPadding,
                      left: Defaults.defaultPadding / 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('New'),
                        ),
                        Container(
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                              color: AppColors.mainColor,
                              width: 1,
                            ),
                            // image: DecorationImage(
                            //   fit: BoxFit.cover,
                            //   image: NetworkImage(controller.categorys[index].avatar!),
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(Defaults.defaultPadding),
              child: Text('Category'),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Obx(() => StaggeredGridView.countBuilder(
                      crossAxisCount: 3,
                      itemCount: controller.categorys.length,
                      itemBuilder: (BuildContext context, int index) =>
                          new Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: Defaults.defaultPadding),
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
                                    image: NetworkImage(
                                        controller.categorys[index].avatar!),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    Defaults.defaultPadding / 2 - 5),
                                child: Text(controller.categorys[index].name!),
                              ),
                            )
                          ],
                        ),
                      ),
                      staggeredTileBuilder: (int index) =>
                          new StaggeredTile.count(1, 0.7),
                      mainAxisSpacing: 5,
                    )),
              ),
            ),
          ],
        ));
  }
}
