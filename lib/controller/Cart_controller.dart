import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Cart_model.dart';
import 'package:delivery_food/services/Cart_services.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var carts = <CartResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  CartService cartService = CartService();

  @override
  void onInit() {
    getcart();
    super.onInit();
  }

  getcart() async {
    try {
      apiResult = await cartService.getcartData();
      if (!apiResult.hasError!) {
        carts.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        print(carts[0].id);
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
