import 'package:delivery_food/view/Cart_page/Cart_Page.dart';
import 'package:delivery_food/view/Favorite_page/Favorite_Page.dart';
import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:delivery_food/view/Offers_page/Offers_Page.dart';
import 'package:delivery_food/view/Profile_page/Profile_Page.dart';
import 'package:delivery_food/view/Virefy_pages/Choose_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../General/Constants.dart';

class BottomBar extends StatefulWidget {
  BottomBar({this.fu, Key? key, this.intid}) : super(key: key);
  var intid;
  var fu;
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 2;
  List _screens = [];
  StatusCode statusCode = StatusCode();

  void _updateIndex(int value) {
    setState(() {
      statusCode.Token != ''
          ? _screens = [
              CartView(),
              FavoriteView(),
              HomeView(),
              OffersView(),
              ProfileView(),
            ]
          : _screens = [
              CartView(),
              FavoriteView(),
              HomeView(),
              ChoseSign(),
              ChoseSign(),
            ];

      _currentIndex = value;
    });
  }

  @override
  void initState() {
    if (widget.intid != null) {
      _currentIndex = widget.intid!;
    }
    statusCode.Token != ''
        ? _screens = [
            CartView(),
            FavoriteView(),
            widget.fu,
            OffersView(),
            ProfileView(),
          ]
        : _screens = [
            CartView(),
            FavoriteView(),
            widget.fu,
            ChoseSign(),
            ChoseSign(),
          ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: AppColors.mainColor,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        selectedIconTheme: IconThemeData(size: 30),
        iconSize: 30,
        backgroundColor: Color(0xFFFFFFFF),
        items: [
          BottomNavigationBarItem(
            label: "cart".tr,
            icon: SvgPicture.asset(
              'assets/svg/Cart icon.svg',
              color: _currentIndex == 0
                  ? AppColors.mainColor
                  : AppColors.darkgreytextColor,
              width: _currentIndex == 0 ? 35 : 25,
            ),
          ),
          BottomNavigationBarItem(
            label: "favorite".tr,
            icon: SvgPicture.asset(
              'assets/svg/Favorate icon.svg',
              color: _currentIndex == 1
                  ? AppColors.mainColor
                  : AppColors.darkgreytextColor,
              width: _currentIndex == 1 ? 35 : 25,
            ),
          ),
          BottomNavigationBarItem(
            label: "home".tr,
            icon: SvgPicture.asset(
              'assets/svg/Home icon.svg',
              color: _currentIndex == 2
                  ? AppColors.mainColor
                  : AppColors.darkgreytextColor,
              width: _currentIndex == 2 ? 35 : 25,
            ),
          ),
          BottomNavigationBarItem(
            label: "offers".tr,
            icon: SvgPicture.asset(
              'assets/svg/Offers icon.svg',
              color: _currentIndex == 3
                  ? AppColors.mainColor
                  : AppColors.darkgreytextColor,
              width: _currentIndex == 3 ? 35 : 25,
            ),
          ),
          BottomNavigationBarItem(
            label: "personalinfo".tr,
            icon: SvgPicture.asset(
              'assets/svg/Profile icon.svg',
              color: _currentIndex == 4
                  ? AppColors.mainColor
                  : AppColors.darkgreytextColor,
              width: _currentIndex == 4 ? 35 : 25,
            ),
          ),
        ],
      ),
    );
  }
}
