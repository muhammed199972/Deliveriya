import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Category_controller.dart';
import 'package:delivery_food/view/Home_page/component/CategoryCard.dart';
import 'package:delivery_food/view/Home_page/component/Logo.dart';
import 'package:delivery_food/view/Home_page/component/Offers_New.dart';
import 'package:delivery_food/view/Home_page/component/SearchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  CategorysController controller = Get.find<CategorysController>();
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(),
                  Expanded(flex: 4, child: LogoStatus()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: Defaults.defaultPadding * 2),
                      child: Row(
                        children: [
                          Text(
                            'Help',
                            style: TextStyle(color: AppColors.blackColor),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            Icons.help_sharp,
                            color: AppColors.greyColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SearchBar(size: size),
            Expanded(
              flex: 3,
              child: ListView(
                children: [
                  Offers_New(size: size),
                  Padding(
                    padding: const EdgeInsets.all(Defaults.defaultPadding),
                    child: Text('Category'),
                  ),
                  Container(
                    child: Obx(
                      () => StaggeredGridView.countBuilder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        itemCount: controller.categorys.length,
                        itemBuilder: (BuildContext context, int index) =>
                            CategorysCard(
                          index: index,
                          datacontroller: controller.categorys[index],
                        ),
                        staggeredTileBuilder: (int index) =>
                            new StaggeredTile.count(1, 0.6),
                        mainAxisSpacing: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
