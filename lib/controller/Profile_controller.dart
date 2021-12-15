import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var ispass1 = false.obs;
  var ispass2 = false.obs;
  var ispass3 = false.obs;
  var date = ''.obs;
  var gender = ''.obs;
  var phone = ''.obs;
  var lang = ''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  var file = File('').obs;
  var filenull = true.obs;
  Future postImg(x) async {
    final pickedFile = await ImagePicker.platform.getImage(source: x);
    if (pickedFile != null) {
      filenull.value = false;
      file.value = File(pickedFile.path);

      update();
      return;
    } else {
      print('No image selected.');
    }
  }
}
