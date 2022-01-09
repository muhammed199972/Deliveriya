import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/controller/Order_controller.dart';
import 'package:delivery_food/controller/Profile_controller.dart';
import 'package:delivery_food/main.dart';
import 'package:delivery_food/view/History_page/History_Page.dart';
import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:delivery_food/controller/loclization_controller.dart';
import 'package:delivery_food/view/Profile_page/Component/OptionProfile.dart';
import 'package:delivery_food/view/Profile_page/Profile_address.dart';
import 'package:delivery_food/view/Profile_page/Profile_info.dart';
import 'package:delivery_food/view/Virefy_pages/Choose_Page.dart';
import 'package:delivery_food/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  var status = StatusCode();
  var contr = Get.put(LanguageController());
  var co = Get.put(OrderController());
  var controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteappbarColor,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'profile'.tr,
          style: TextStyle(color: AppColors.blackColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                //  Column(
                // children: [
                InkWell(
              onTap: () {
                Get.offAll(
                  BottomBar(
                    intid: 0,
                    fu: HomeView(),
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/svg/Cart icon.svg',
                color: AppColors.mainColor,
                width: size.width >= 600 ? 40 : 23,
              ),
            ),
            // Text(
            //   '2',
            //   style: TextStyle(color: AppColors.mainColor),
            // ),
            //   ],
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                //  Column(
                //   children: [
                InkWell(
              onTap: () => Get.offAll(
                BottomBar(
                  intid: 1,
                  fu: HomeView(),
                ),
              ),
              child: Icon(
                Icons.favorite_border_outlined,
                color: AppColors.mainColor,
                size: size.width >= 600 ? 40 : 23,
              ),
            ),
            //     Text(
            //       '2',
            //       style: TextStyle(color: AppColors.mainColor),
            //     ),
            //   ],
            // ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Obx(() => Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFDADADA),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.mainColor,
                          width: 1,
                        ),
                        image: DecorationImage(
                            image: NetworkImage(controller
                                        .profile.value.avatar ==
                                    null
                                ? status.imgdefault
                                : '${status.urlimage + controller.profile.value.avatar}'),
                            fit: BoxFit.cover),
                      ),
                      width: size.width * 0.165,
                      height: size.height * 0.093,
                      margin: Constansbox.box.read('lang') == 'en'
                          ? EdgeInsets.only(
                              bottom: 0, left: 17, top: 10, right: 8)
                          : EdgeInsets.only(
                              bottom: 0, left: 8, top: 10, right: 17),
                    )),
                Obx(() => Text(controller.profile.value.name ?? '',
                    style: size.width >= 600
                        ? Styles.defualttab
                        : Styles.defualtmobile)),
              ],
            ),
            SizedBox(
              height: 28,
            ),
            OptionProfile(
              size: size,
              icon: SvgPicture.asset(
                'assets/svg/edit.svg',
                width: size.width <= 350 ? 15 : (size.width >= 600 ? 40 : 20),
              ),
              txt: 'personalinfo'.tr,
              iconarrow: Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              ontap: () {
                controller.getprofile();
                Get.to(() => ProfileInfo());
              },
            ),
            OptionProfile(
              size: size,
              icon: SvgPicture.asset(
                'assets/svg/address.svg',
                width: size.width <= 350 ? 15 : (size.width >= 600 ? 40 : 20),
              ),
              txt: 'myaddress'.tr,
              iconarrow: Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              ontap: () {
                Get.to(() => ProfileAddress());
              },
            ),
            OptionProfile(
              size: size,
              icon: SvgPicture.asset(
                'assets/svg/history.svg',
                color: AppColors.mainColor,
                width: size.width <= 350 ? 15 : (size.width >= 600 ? 40 : 20),
              ),
              txt: 'orderhistory'.tr,
              iconarrow: Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              ontap: () async {
                await co.getorder('');
                Get.to(() => HistoryPage());
              },
            ),
            OptionProfile(
              size: size,
              icon: SvgPicture.asset(
                'assets/svg/help.svg',
                width: size.width <= 350 ? 15 : (size.width >= 600 ? 40 : 20),
              ),
              txt: 'help'.tr,
              iconarrow: Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              ontap: () {
                DialogsUtils.showdialogHelp(
                    m: '099*********',
                    onPressed: () {
                      Get.back();
                    });
              },
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 17),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/net.svg',
                          width: size.width <= 350
                              ? 15
                              : (size.width >= 600 ? 40 : 20),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'changelanguage'.tr,
                          style: size.width >= 600
                              ? Styles.defualttab
                              : Styles.defualtmobile,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton(
                      icon: Icon(
                        Icons.translate_outlined,
                        color: AppColors.darkgreytextColor.withOpacity(0.5),
                        size: 25,
                      ),
                      elevation: 1,
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text("arabic".tr,
                                  style: size.width >= 600
                                      ? Styles.defualttab
                                      : Styles.defualtmobile),
                              value: 1,
                              onTap: () {
                                contr.changeLanguage('ar');
                              },
                            ),
                            PopupMenuItem(
                              child: Text("english".tr,
                                  style: size.width >= 600
                                      ? Styles.defualttab
                                      : Styles.defualtmobile),
                              value: 2,
                              onTap: () {
                                contr.changeLanguage('en');
                              },
                            ),
                          ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/logout.svg',
                      width: size.width >= 600 ? 40 : 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'logout'.tr,
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: size.width <= 350
                              ? 15
                              : (size.width >= 600 ? 40 : 20)),
                    )
                  ],
                ),
                onTap: () async {
                  await Constansbox.box.remove('New');
                  await Constansbox.box.remove('cartsid');
                  await Constansbox.box.remove('cartscounte');
                  await Constansbox.box.remove('New');
                  await Constansbox.box.remove('offers');
                  await Constansbox.box.remove('cartsid');
                  await Constansbox.box.remove('cartscounte');
                  await Constansbox.box.remove('accessToken');
                  await Constansbox.box.remove('refreshToken');
                  status.Token = '';

                  main();
                  Get.offAll(() => ChoseSign());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
