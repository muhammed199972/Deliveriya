import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/view/Profile_page/AddAddress.dart';
import 'package:delivery_food/view/Profile_page/Component/AddressWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileAddress extends StatelessWidget {
  ProfileAddress({Key? key}) : super(key: key);

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
          'Profile address',
          style: TextStyle(color: AppColors.blackColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, int index) => AddressWidget(
                size: size,
                icon: SvgPicture.asset('assets/svg/address.svg'),
                ontap: () {},
                txt: 'Syria - Damascus St. Al Ameen',
                subtitle: '+963 933 222 111',
              ),
            ),
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
