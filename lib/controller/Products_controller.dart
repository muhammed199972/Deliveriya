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

  @override
  void onInit() {
    super.onInit();
  }

  getproduct({
    String? subCategoryId,
    int? offset,
    int? limit,
    String? q,
  }) async {
    try {
      products.value = [];
      apiResult = (await product.getproductsData(
        subCategoryId!,
        offset!,
        limit!,
        q!,
      ))!;

      if (!apiResult.hasError!) {
        products.value = apiResult.data;
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

  getListproduct({
    int? offset,
    int? limit,
    List<dynamic>? Listproduct,
  }) async {
    try {
      products.value = [];
      apiResult = (await product.getListproductsData(
        offset!,
        limit!,
        Listproduct!,
      ))!;

      if (!apiResult.hasError!) {
        products.value = apiResult.data;
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
