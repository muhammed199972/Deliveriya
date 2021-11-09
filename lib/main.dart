// @dart=2.9

import 'package:delivery_food/navbar.dart';
import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(411, 683),
        builder: () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: BottomBar(),
              getPages: [GetPage(name: '/home', page: () => HomePage())],
            ));
  }
}
