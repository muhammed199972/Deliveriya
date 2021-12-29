// @dart=2.9

import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/Binds.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/lang/traranslation.dart';
import 'package:delivery_food/view/Home_page/Home_page.dart';
import 'package:delivery_food/view/Virefy_pages/Choose_Page.dart';
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
  StatusCode statusCode = StatusCode();
  @override
  Widget build(BuildContext context) {
    Constansbox.box.writeIfNull('New', []);
    Constansbox.box.writeIfNull('offers', []);
    Constansbox.box.writeIfNull('favorite', []);
    Constansbox.box.writeIfNull('cartsid', []);
    Constansbox.box.writeIfNull('cartscounte', []);
    Constansbox.box.writeIfNull('Search', []);
    Constansbox.box.writeIfNull('SearchHome', []);
    Constansbox.box.writeIfNull('accessToken', '');
    Constansbox.box.writeIfNull('refreshToken', '');
    Constansbox.box.writeIfNull('lang', '');

    //Constansbox.box.remove('New');
    // Constansbox.box.remove('cartsid');
    // Constansbox.box.remove('cartscounte');
    //Constansbox.box.remove('New');
    //Constansbox.box.remove('offers');
    // Constansbox.box.remove('cartsid');
    // Constansbox.box.remove('cartscounte');

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

        home: statusCode.Token == ''
            ? ChoseSign()
            : BottomBar(
                fu: HomeView(),
              ),
        translations: Translation(),
        locale: Locale(Constansbox.box.read('lang') == ''
            ? 'en'
            : Constansbox.box.read('lang')),
        fallbackLocale: Locale(Constansbox.box.read('lang') == ''
            ? 'en'
            : Constansbox.box.read('lang')),
      ),
      // getPages: [GetPage(name: '/home', page: () => SigninPage())],
    );
  }
}
