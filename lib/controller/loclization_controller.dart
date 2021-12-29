import 'dart:ui';

import 'package:delivery_food/General/Constants.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  Constans Constansbox = Constans();

  void changeLanguage(String code) {
    var local = Locale(code);
    Constansbox.box.write('lang', code);

    Get.updateLocale(local);
  }
}
