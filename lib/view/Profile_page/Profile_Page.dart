import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/view/Profile_page/Component/OptionProfile.dart';
import 'package:delivery_food/view/Profile_page/Profile_address.dart';
import 'package:delivery_food/view/Profile_page/Profile_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_rounded,
          color: AppColors.blackColor,
        ),
        title: Text(
          'Profile',
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
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
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
                    )),
              ),
              Text('Mohammad'),
            ],
          ),
          SizedBox(
            height: 28,
          ),
          OptionProfile(
            size: size,
            icon: SvgPicture.asset('assets/svg/edit.svg'),
            txt: 'Personal Info',
            iconarrow: Icon(
              Icons.arrow_forward_ios_rounded,
            ),
            ontap: () {
              Get.to(() => ProfileInfo());
            },
          ),
          OptionProfile(
            size: size,
            icon: SvgPicture.asset('assets/svg/address.svg'),
            txt: 'My addresses',
            iconarrow: Icon(
              Icons.arrow_forward_ios_rounded,
            ),
            ontap: () {
              Get.to(() => ProfileAddress());
            },
          ),
          OptionProfile(
            size: size,
            icon: SvgPicture.asset('assets/svg/history.svg'),
            txt: 'Order history',
            iconarrow: Icon(
              Icons.arrow_forward_ios_rounded,
            ),
            ontap: () {},
          ),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 17),
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
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/net.svg'),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Change language',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  PopupMenuButton(
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.darkgreytextColor.withOpacity(0.5),
                          size: 25,
                        ),
                      ),
                      elevation: 1,
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text("Arabic"),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: Text("English"),
                              value: 2,
                            ),
                          ]),
                ],
              ),
            ),
          ),
          OptionProfile(
            size: size,
            icon: SvgPicture.asset('assets/svg/help.svg'),
            txt: 'Help',
            iconarrow: Icon(
              Icons.arrow_forward_ios_rounded,
            ),
            ontap: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/logout.svg'),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Log out',
                    style: TextStyle(color: AppColors.mainColor, fontSize: 20),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
