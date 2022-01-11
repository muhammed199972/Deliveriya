import 'package:delivery_food/lang/ar.dart';
import 'package:delivery_food/lang/en.dart';
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
