import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Auth_controller.dart';
import 'package:delivery_food/view/Signin_Page/Component/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key, required this.txtButton}) : super(key: key);
  String txtButton;
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: Defaults.defaultPadding * 4),
                child: SvgPicture.asset('assets/svg/mainlogo.svg'),
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
                        Visibility(
                          visible: controller.sendcode.value,
                          child: OTPTextField(
                            width: size.width,
                            length: 6,
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.underline,
                            outlineBorderRadius: 4,
                            fieldWidth: 40,
                            style: TextStyle(color: Colors.black),
                            otpFieldStyle: OtpFieldStyle(
                              backgroundColor: Colors.grey.shade50,
                              disabledBorderColor: Colors.black,
                              enabledBorderColor: Colors.black,
                            ),
                            onChanged: (k) {},
                            onCompleted: (n) {
                              controller.postcodeNumber(
                                _phoneController.text,
                                n,
                              );
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
                            child: Text(txtButton, style: Styles.buttonStyle),
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
