import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Address_controller.dart';
import 'package:delivery_food/view/Profile_page/Component/TextField.dart';
import 'package:delivery_food/view/Virefy_pages/Component/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  AddAddress({Key? key}) : super(key: key);
  var controller = Get.find<AddressController>();

  final _streetController = TextEditingController();
  final _detailedController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteappbarColor,
        elevation: 1,
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
          'addaddress'.tr,
          style: TextStyle(color: AppColors.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
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
                  children: <Widget>[
                    Expanded(
                      child: Obx(() {
                        return DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String?>(
                                value: controller.vCity.value == ''
                                    ? null
                                    : controller.vCity.value,
                                iconSize: 30,
                                icon: (null),
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                                hint: Text('selectcity'.tr,
                                    style: size.width >= 600
                                        ? Styles.defualttab
                                        : Styles.defualtmobile),
                                onChanged: (String? newValue) async {
                                  controller.vCity.value = newValue!;
                                  await controller.getTown(newValue);
                                  controller.vTown.value =
                                      controller.towns[0].id.toString();
                                },
                                items: controller.cities.isNotEmpty
                                    ? controller.cities.map((item) {
                                        return new DropdownMenuItem<String?>(
                                          child: new Text(item.name!,
                                              style: size.width >= 600
                                                  ? Styles.defualttab
                                                  : Styles.defualtmobile),
                                          value: item.id.toString(),
                                        );
                                      }).toList()
                                    : []),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String?>(
                                  value: controller.vTown.value,
                                  iconSize: 30,
                                  icon: (null),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                  hint: Text('selecttown'.tr,
                                      style: size.width >= 600
                                          ? Styles.defualttab
                                          : Styles.defualtmobile),
                                  onChanged: (String? newValue) {
                                    controller.vTown.value = newValue!;
                                  },
                                  items: controller.towns.isNotEmpty
                                      ? controller.towns.map((item) {
                                          print(item.name);
                                          return new DropdownMenuItem<String?>(
                                            child: Text(item.name!,
                                                style: size.width >= 600
                                                    ? Styles.defualttab
                                                    : Styles.defualtmobile),
                                            value: item.id.toString(),
                                          );
                                        }).toList()
                                      : []),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: TextFieldProfwidget(
                  controller: _streetController,
                  validator: validate,
                  lebel: 'street'.tr,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: TextFieldProfwidget(
                  h: 100,
                  lines: 5,
                  controller: _detailedController,
                  validator: validate,
                  lebel: 'addressdetails'.tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 150),
                child: ButtonWidget2(
                    size: size,
                    txt: 'submit'.tr,
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        if (controller.vTown.value == '' ||
                            controller.vCity.value == '') {
                          BotToast.showText(
                            text: 'choose town plaese',
                            align: Alignment.center,
                          );
                        } else {
                          Map<String, dynamic> body = {
                            'TownId': controller.vTown.value,
                            'street': controller.vTown.value,
                            'locationDescription': _detailedController.text,
                          };
                          controller.addAddress(body);
                        }
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validate(String? value) {
    if (value!.length == 0)
      return 'Please enter value';
    else
      return null;
  }
}
