import 'dart:ui';

import 'package:get/get.dart';

class LanguageController extends GetxController {
  void changeLanguage(String code) {
    var local = Locale(code);
    Get.updateLocale(local);
  }
}
