import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Cart_model.dart';
import 'package:delivery_food/model/Delete.dart';
import 'package:delivery_food/model/Patch_data.dart';
import 'package:delivery_food/model/Post_data.dart';
import 'package:delivery_food/services/Cart_services.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var carts = <CartResponse>[].obs;
  var postCarts = PostResponse().obs;
  var patchCarts = PatchResponse().obs;
  var deleteCarts = DeleteResponse().obs;

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
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      print(e);
    }
  }

  addTocart(int quantity, String id) async {
    try {
      apiResult = await cartService.postcartData(quantity, id);
      if (!apiResult.hasError!) {
        postCarts.value = apiResult.data;
        hasError.value = apiResult.hasError!;
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      print(e);
    }
  }

  patchcart(int quantity, id) async {
    try {
      apiResult = await cartService.patchcartData(quantity, id);
      if (!apiResult.hasError!) {
        patchCarts.value = apiResult.data;
        hasError.value = apiResult.hasError!;
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      print(e);
    }
  }

  deletecart(id) async {
    try {
      apiResult = await cartService.deletecartData(id);
      if (!apiResult.hasError!) {
        deleteCarts.value = apiResult.data;
        hasError.value = apiResult.hasError!;
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      print(e);
    }
  }
}
