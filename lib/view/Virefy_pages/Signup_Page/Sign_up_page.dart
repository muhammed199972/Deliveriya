import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Auth_controller.dart';
import 'package:delivery_food/view/Virefy_pages/Component/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key, required this.txtButton}) : super(key: key);
  String txtButton;
  final _confirmPassController = TextEditingController();
  final _passController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/png/background.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: Defaults.defaultPadding * 4),
                child: SvgPicture.asset('assets/svg/mainlogo.svg'),
              ),
              Spacer(
                flex: 1,
              ),
              Form(
                key: formkey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.11, vertical: 20),
                  child: Column(
                    children: [
                      Obx(() => TextFieldwidget(
                            txttype: TextInputType.visiblePassword,
                            validator: validatePass,
                            controller: _passController,
                            lebel: 'Password',
                            prefixtxt: '',
                            icon: Icon(
                              Icons.vpn_key_outlined,
                              color: AppColors.greyColor,
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
                        height: 22,
                      ),
                      Obx(() => TextFieldwidget(
                            txttype: TextInputType.visiblePassword,
                            validator: validatePass,
                            controller: _confirmPassController,
                            lebel: 'Confirm Password',
                            prefixtxt: '',
                            icon: Icon(
                              Icons.vpn_key_outlined,
                              color: AppColors.greyColor,
                            ),
                            ispassword: controller.ispass.value,
                          )),
                      SizedBox(
                        height: 44,
                      ),
                      Container(
                        height: size.height * 0.15,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: AppColors.lightgreyColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password must:',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '. ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Be at least 6 characters long.',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '. ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Contains one or more numbers.',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '. ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Includes at least one of the following special characters: \n <=>?@[|]~, or a space.',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            if (_passController.text !=
                                _confirmPassController) {
                              BotToast.showText(
                                text: 'Not correct!',
                                align: Alignment.center,
                              );
                            }
                            // controller.getcode(_phoneController.text);
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          side:
                              BorderSide(color: AppColors.mainColor, width: 2),
                        ),
                        child: Text(txtButton, style: Styles.buttonStyle),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
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
