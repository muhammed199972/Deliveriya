import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Products_model.dart';
import 'package:delivery_food/services/Products_service.dart';
import 'package:get/state_manager.dart';

class ProductsController extends GetxController {
  var products = <ProductsStatus>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  ProductService product = ProductService();
  @override
  void onInit() {
    getproduct();
    super.onInit();
  }

  getproduct() async {
    try {
      apiResult = (await product.getproductsData())!;
      if (!apiResult.hasError!) {
        products.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        print(product);
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
      }
    } finally {}
  }
}
