import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/controller/Address_controller.dart';
import 'package:delivery_food/view/Profile_page/AddAddress.dart';
import 'package:delivery_food/view/Profile_page/Component/AddressWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileAddress extends StatelessWidget {
  ProfileAddress({Key? key}) : super(key: key);
  var controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.blackColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'myaddress'.tr,
          style: TextStyle(color: AppColors.blackColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.address.length,
                  itemBuilder: (context, int index) => AddressWidget(
                    size: size,
                    icon: SvgPicture.asset('assets/svg/address.svg'),
                    txt:
                        '${controller.address[index].town!.city!.name}-${controller.address[index].town!.name}',
                    subtitle:
                        '${controller.address[index].locationDescription ?? ''}',
                    icondel: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          DialogsUtils.showdialogdelete(
                              m: 'Proceed ?',
                              onPressedCancel: () async {
                                Get.back();
                              },
                              onPressedOk: () {
                                controller.deleteAddress(
                                    controller.address[index].id.toString());
                              });
                        },
                        icon: Image.asset(
                          'assets/png/remove.png',
                        )),
                  ),
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        child: SvgPicture.asset(
          'assets/svg/plus.svg',
          color: AppColors.whiteColor,
        ),
        onPressed: () {
          Get.to(() => AddAddress());
        },
      ),
    );
  }
}
