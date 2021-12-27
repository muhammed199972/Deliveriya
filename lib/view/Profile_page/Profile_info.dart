import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Profile_controller.dart';
import 'package:delivery_food/view/Profile_page/Component/TextField.dart';
import 'package:delivery_food/view/Profile_page/Profile_info_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({Key? key}) : super(key: key);
  var controller = Get.find<ProfileController>();

  var formkey = GlobalKey<FormState>();
  var formkey1 = GlobalKey<FormState>();
  var formkey2 = GlobalKey<FormState>();
  var status = StatusCode();
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
          'Profile Info',
          style: TextStyle(color: AppColors.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        margin: EdgeInsets.only(
                            bottom: 0, left: 17, top: 10, right: 8),
                      )),
                  // ),
                  Obx(() => Text(controller.profile.value.name ?? '')),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  children: [
                    TextFieldProfwidget(
                      enabled: false,
                      controller: controller.firstnameController,
                      validator: validatePass,
                      lebel: 'User name',
                    ),
                    TextFieldProfwidget(
                      enabled: false,
                      controller: controller.genderController,
                      validator: validatePass,
                      lebel: 'Gender',
                    ),
                    TextFieldProfwidget(
                      enabled: false,
                      controller: controller.datebirthController,
                      validator: validatePass,
                      lebel: 'Date Birth',
                    ),
                    TextFieldProfwidget(
                      enabled: false,
                      controller: controller.phoneController,
                      validator: validatePass,
                      lebel: 'phone',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => ProfileInfoEdit());
        },
        backgroundColor: AppColors.mainColor,
        child: Icon(Icons.edit),
      ),
    );
  }

  String? validateMobile(String? value) {
    if (value!.length == 0)
      return 'Please enter PhoneNumber';
    else if (value.startsWith('0', 0)) {
      return 'enter like 9********';
    } else
      return null;
  }

  String? validatePass(String? value) {
    if (value!.length == 0)
      return 'Please enter Password';
    else if (value.length < 6) {
      return 'Password value should contain more than 6 ';
    } else
      return null;
  }
}