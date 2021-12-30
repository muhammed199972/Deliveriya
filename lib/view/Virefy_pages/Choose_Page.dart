import 'dart:developer';

import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Auth_controller.dart';
import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:delivery_food/view/Virefy_pages/Component/Buttons.dart';
import 'package:delivery_food/view/Virefy_pages/Signin_Page/Sign_in_page.dart';
import 'package:delivery_food/view/Virefy_pages/Signup_Page/Sign_up_page.dart';
import 'package:delivery_food/view/Virefy_pages/Virefication_Page/Virefication_Page.dart';
import 'package:delivery_food/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChoseSign extends StatelessWidget {
  ChoseSign({Key? key}) : super(key: key);
  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('--------------');
    log('${size.width}');
    log('${size.height}');

    print('--------------');
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
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    ButtonWidget(
                      size: size,
                      txt: 'Sign Up',
                      onTap: () {
                        controller.authType.value = 'signup';
                        Get.to(() => VerificationPage(
                              txtButton: 'Virefy Code',
                            ));
                      },
                    ),
                    ButtonWidget(
                      size: size,
                      txt: 'Sign In',
                      onTap: () {
                        controller.authType.value = 'login';
                        Get.to(() => SigninPage(txtButton: 'Sign in'));
                      },
                    ),
                    ButtonWidget(
                      size: size,
                      txt: 'Guest',
                      onTap: () {
                        controller.authType.value = 'login';
                        Get.offAll(
                          () => BottomBar(
                            fu: HomeView(),
                          ),
                        );
                      },
                    ),
                  ],
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
}
