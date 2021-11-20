// @dart=2.9

import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:delivery_food/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
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
              //   color: Colors.transparent,
              theme: ThemeData(
                primarySwatch: Colors.red,
              ),
              home: BottomBar(),
              getPages: [GetPage(name: '/home', page: () => HomeView())],
            ));
  }
}
