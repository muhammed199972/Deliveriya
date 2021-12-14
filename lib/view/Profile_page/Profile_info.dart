import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Profile_controller.dart';
import 'package:delivery_food/view/Profile_page/Component/OptionProfile.dart';
import 'package:delivery_food/view/Profile_page/Component/TextField.dart';
import 'package:delivery_food/view/Virefy_pages/Component/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({Key? key}) : super(key: key);
  var controller = Get.put(ProfileController());
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _datebirthController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _newpassController = TextEditingController();
  final _oldpassController = TextEditingController();

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/png/hestory.png',
              width: 40,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Defaults.defaultPadding * 2.5,
                              vertical: Defaults.defaultPadding * 2),
                          height: size.height * 0.191,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.darkgreyColor,
                                offset: Offset(0, -2),
                                blurRadius: 5,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/svg/cam.svg'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Camera',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.mainColor),
                                        ),
                                      ],
                                    )),
                              ),
                              Divider(
                                color: AppColors.darkgreytextColor,
                              ),
                              Center(
                                child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svg/galary.svg'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Galary',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.mainColor),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          )),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFDADADA),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.mainColor,
                          width: 1,
                        )),
                    width: size.width * 0.165,
                    height: size.height * 0.093,
                    margin:
                        EdgeInsets.only(bottom: 0, left: 17, top: 10, right: 8),
                    child: CircleAvatar(
                      child: SvgPicture.asset(
                        "assets/svg/Profile icon.svg",
                        color: AppColors.darkgreytextColor,
                      ),
                      backgroundColor: AppColors.whiteColor,
                    ),
                  ),
                ),
                Text('Mohammad'),
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
                    controller: _firstnameController,
                    validator: validatePass,
                    lebel: 'First name',
                  ),
                  TextFieldProfwidget(
                    controller: _lastnameController,
                    validator: validatePass,
                    lebel: 'Last name',
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(fontSize: 17),
                          ),
                          PopupMenuButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.blackColor,
                                size: 20,
                              ),
                              elevation: 1,
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Text("Male"),
                                      value: 1,
                                    ),
                                    PopupMenuItem(
                                      child: Text("Female"),
                                      value: 2,
                                    ),
                                  ]),
                        ],
                      ),
                    ),
                  ),
                  OptionProfile(
                    padd: 0,
                    size: size,
                    txt: 'Date Birth',
                    iconarrow: Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                    ontap: () {
                      DatePicker.showDatePicker(context);
                    },
                  ),
                  OptionProfile(
                    padd: 0,
                    size: size,
                    txt: 'Phone',
                    iconarrow: Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                    ontap: () {
                      Get.bottomSheet(
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Defaults.defaultPadding * 2.5,
                              vertical: Defaults.defaultPadding * 2),
                          height: size.height * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.darkgreyColor,
                                offset: Offset(0, -2),
                                blurRadius: 5,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: TextFieldwidget(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(9),
                            ],
                            validator: validateMobile,
                            controller: _phoneController,
                            lebel: 'New Phone Number',
                            prefixtxt: '+963',
                            icon: Icon(
                              Icons.phone_android,
                              color: AppColors.darkgreytextColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextButton(
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Defaults.defaultPadding * 2.5,
                            vertical: Defaults.defaultPadding / 2),
                        height: size.height * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.darkgreyColor,
                              offset: Offset(0, -2),
                              blurRadius: 5,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            Obx(() => TextFieldwidget(
                                  txttype: TextInputType.visiblePassword,
                                  validator: validatePass,
                                  controller: _oldpassController,
                                  lebel: 'Old Password',
                                  prefixtxt: '',
                                  icon: Icon(
                                    Icons.vpn_key_outlined,
                                    color: AppColors.darkgreytextColor,
                                  ),
                                  ispassword: controller.ispass.value,
                                  suffixIcon: controller.ispass.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  suffixPressed: () {
                                    controller.ispass.value =
                                        !controller.ispass.value;
                                  },
                                )),
                            SizedBox(
                              height: 25,
                            ),
                            Obx(() => TextFieldwidget(
                                  txttype: TextInputType.visiblePassword,
                                  validator: validatePass,
                                  controller: _newpassController,
                                  lebel: 'New Password',
                                  prefixtxt: '',
                                  icon: Icon(
                                    Icons.vpn_key_outlined,
                                    color: AppColors.darkgreytextColor,
                                  ),
                                  ispassword: controller.ispass.value,
                                  suffixIcon: controller.ispass.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  suffixPressed: () {
                                    controller.ispass.value =
                                        !controller.ispass.value;
                                  },
                                )),
                            SizedBox(
                              height: 25,
                            ),
                            Obx(() => TextFieldwidget(
                                  txttype: TextInputType.visiblePassword,
                                  validator: validatePass,
                                  controller: _confirmPassController,
                                  lebel: 'Confirm Password',
                                  prefixtxt: '',
                                  icon: Icon(
                                    Icons.vpn_key_outlined,
                                    color: AppColors.darkgreytextColor,
                                  ),
                                  ispassword: controller.ispass.value,
                                  suffixIcon: controller.ispass.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  suffixPressed: () {
                                    controller.ispass.value =
                                        !controller.ispass.value;
                                  },
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  )),
            )
          ],
        ),
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
