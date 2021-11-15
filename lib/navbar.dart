import 'package:delivery_food/view/Cart_page/Cart_Page.dart';
import 'package:delivery_food/view/Favorite_page/Favorite_Page.dart';
import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:delivery_food/view/Offers_page/Offers_Page.dart';
import 'package:delivery_food/view/Profile_page/Profile_Page.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 2;
  List _screens = [
    CartView(),
    FavoriteView(),
    HomeView(),
    OffersView(),
    ProfileView(),
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Colors.blue[700],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "Offers",
            icon: Icon(Icons.local_offer_outlined),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
