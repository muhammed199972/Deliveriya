import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/Favorite_model.dart';
import 'package:delivery_food/services/Order_services.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = <FavoriteResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  var isLoading = true.obs;

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
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          orders.value = apiResult.data;
          hasError.value = apiResult.hasError!;
          isLoading.value = false;
        } else {
          hasError.value = apiResult.hasError!;
          massage.value = apiResult.errorMassage!;
          DialogsUtils.showdialog(
              m: massage.value,
              onPressed: () {
                Get.back();
                Get.back();
              });
        }
      } else {
        getorder();
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
            Get.back();
          });
    }
  }
}
