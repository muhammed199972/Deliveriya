import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/model/Img_History.dart';
import 'package:delivery_food/model/Order_model.dart';
import 'package:delivery_food/model/Post_data.dart';
import 'package:delivery_food/services/Order_services.dart';
import 'package:delivery_food/view/Cart_page/Cart_Page.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = <OrderResponse>[].obs;
  var ordersImg = <ImgOrderResponse>[].obs;
  var postorder = PostResponse().obs;
  var hasError = true.obs;
  var massage = ''.obs;

  ApiResult apiResult = ApiResult();
  OrderService orderService = OrderService();

  @override
  void onInit() {
    getorderAsset();

    super.onInit();
  }

  getorder(String q) async {
    try {
      orders.value = [];
      BotToast.showLoading();
      apiResult = await orderService.getorderData(q);
      if (!apiResult.hasError!) {
        orders.value = apiResult.data;
        hasError.value = apiResult.hasError!;
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
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
            Get.back();
          });
    } finally {
      BotToast.closeAllLoading();
    }
  }

  getorderAsset() async {
    try {
      apiResult = await orderService.getorderAsset();
      if (!apiResult.hasError!) {
        ordersImg.value = apiResult.data;
        hasError.value = apiResult.hasError!;
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

  postOrder(var body) async {
    try {
      apiResult = await orderService.postorderData(body);
      if (!apiResult.hasError!) {
        postorder.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        BotToast.showLoading();
        await getorder('');
        Get.find<CartController>().getcart();
        Get.back();
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
        DialogsUtils.showdialog(
            m: massage.value,
            onPressed: () {
              Get.back();
            });
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      print(e);
    } finally {
      BotToast.closeAllLoading();
    }
  }
}
