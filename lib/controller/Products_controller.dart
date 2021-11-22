import 'dart:developer';

import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Products_model.dart';
import 'package:delivery_food/services/Products_service.dart';
import 'package:get/state_manager.dart';

class ProductsController extends GetxController {
  var products = <ProductsResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  ProductService product = ProductService();
  // String query = '';

  @override
  void onInit() {
    // getproduct('', 0, 8, query);
    super.onInit();
  }

  getproduct({
    String? subCategoryId,
    int? offset,
    int? limit,
    String? q,
  }) async {
    try {
      apiResult = (await product.getproductsData(
        subCategoryId!,
        offset!,
        limit!,
        q!,
      ))!;

      if (!apiResult.hasError!) {
        products.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        log('${subCategoryId}', name: 'sss');
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

  int _quantity = 0;

  int get itemQuantity => _quantity;

  void itemQuantitySet(int value) {
    _quantity = value;
    update();
  }

  ///---------------------------------------------------------------------------
  void increaseProductQuantity({int maxQuantity = 50}) {
    if (itemQuantity < maxQuantity) {
      _quantity++;
      update();
    } else
      print('maxQuantity!!!');
  }

  void decreaseProductQuantity({int min = 1}) {
    if (itemQuantity > min) {
      _quantity--;
      update();
    }
  }
}
