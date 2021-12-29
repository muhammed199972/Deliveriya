import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/Shimmer_loading.dart';
import 'package:delivery_food/controller/Address_controller.dart';
import 'package:delivery_food/controller/Category_controller.dart';
import 'package:delivery_food/view/Home_page/component/CategoryCard.dart';
import 'package:delivery_food/view/Home_page/component/Logo.dart';
import 'package:delivery_food/view/Home_page/component/Offers_New.dart';
import 'package:delivery_food/view/Home_page/component/SearchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  CategorysController controller = Get.put(CategorysController());
  // AddressController ca = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/png/background.png'),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Defaults.defaultPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(),
                      Expanded(
                          flex: 2,
                          child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: LogoStatus())),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: Defaults.defaultPadding * 4),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'help'.tr,
                                  style: TextStyle(color: AppColors.blackColor),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  child: Icon(
                                    Icons.help_sharp,
                                    color: AppColors.darkgreytextColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SearchBar(size: size),
              Expanded(
                flex: 3,
                child: Obx(() => ListView(
                      children: [
                        !controller.isLoading.value
                            ? Offers_New(size: size)
                            : ShimmerWidget.offersNewLoading(),
                        Padding(
                          padding:
                              const EdgeInsets.all(Defaults.defaultPadding),
                          child: Text('category'.tr),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: !controller.isLoading.value
                                ? StaggeredGridView.countBuilder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: 3,
                                    itemCount: controller.categorys.length,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            CategorysCard(
                                      index: index,
                                      datacontroller:
                                          controller.categorys[index],
                                    ),
                                    staggeredTileBuilder: (int index) =>
                                        new StaggeredTile.count(1, 1),
                                    mainAxisSpacing: 11,
                                    crossAxisSpacing: 11,
                                  )
                                : ShimmerWidget.categoryLoading(),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
