import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Auth_controller.dart';
import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:delivery_food/view/Signin_Page/Component/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: Defaults.defaultPadding * 4),
                child: Image.asset('assets/png/logo.png'),
              ),
              Spacer(
                flex: 2,
              ),
              Obx(
                () => Form(
                  key: formkey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.11, vertical: 20),
                    child: Column(
                      children: [
                        Visibility(
                          visible: !controller.sendcode.value,
                          child: TextFieldwidget(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(9),
                            ],
                            validator: validateMobile,
                            controller: _phoneController,
                            lebel: 'Phone Number',
                            prefixtxt: '+963',
                            icon: Icon(
                              Icons.phone_android,
                              color: AppColors.greyColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // TextFieldwidget(
                        //   controller: _codeController,
                        //   lebel: 'Code',
                        //   icon: Icon(
                        //     Icons.message,
                        //     color: AppColors.greyColor,
                        //   ),
                        // ),
                        Visibility(
                          visible: controller.sendcode.value,
                          child: OTPTextField(
                            width:
                                size.width, //The Width is the all the screen.
                            length: 6, //4 Numbers will be Enterd
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.underline,
                            //keyboardType: TextInputType.text,
                            outlineBorderRadius: 4,
                            fieldWidth: 40,
                            style: TextStyle(color: Colors.black),
                            otpFieldStyle: OtpFieldStyle(
                              backgroundColor: Colors.grey.shade50,
                              disabledBorderColor: Colors.black,
                              enabledBorderColor: Colors.black,
                            ),

                            onCompleted: (n) {
                              Get.offAll(HomeView());
                            },
                          ),
                        ),
                        SizedBox(
                          height: 44,
                        ),
                        Visibility(
                          visible: !controller.sendcode.value,
                          child: TextButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                controller.getcode(_phoneController.text);
                              }
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              side: BorderSide(
                                  color: AppColors.mainColor, width: 2),
                            ),
                            child: Text('Sign in',
                                style: TextStyle(
                                    color: AppColors.mainColor, fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
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
}
