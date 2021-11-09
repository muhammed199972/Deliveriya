import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Favorite_model.dart';
import 'package:delivery_food/services/Order_services.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = <FavoriteResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  OrderService orderService = OrderService();

  @override
  void onInit() {
    getorder();
    super.onInit();
  }

  getorder() async {
    try {
      apiResult = await orderService.getorderData();
      if (!apiResult.hasError!) {
        orders.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        print(orders[0].id);
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
