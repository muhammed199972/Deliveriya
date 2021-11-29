import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Auth_model.dart';
import 'package:delivery_food/services/Auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var auth = AuthResponse().obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  AuthService authservice = AuthService();
  var sendcode = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  getcode(String phone) async {
    try {
      apiResult = await authservice.getauthCode(phone);
      if (!apiResult.hasError!) {
        auth.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        sendcode.value = true;
        print(auth.value.code);
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
      }
    } finally {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
    }
  }
}
