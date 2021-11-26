// @dart=2.9

import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/Binds.dart';
import 'package:delivery_food/General/Constants.dart';
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
  Constans Constansbox = Constans();
  final botToastBuilder = BotToastInit();
  @override
  Widget build(BuildContext context) {
    Constansbox.box.writeIfNull('New', [1999]);
    Constansbox.box.writeIfNull('offers', [1999]);
    return ScreenUtilInit(
        designSize: Size(411, 683),
        builder: () => GetMaterialApp(
              builder: (context, child) {
                child = botToastBuilder(context, child);
                return child;
              },
              initialBinding: Binds(),
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
