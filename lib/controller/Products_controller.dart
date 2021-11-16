import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Products_model.dart';
import 'package:delivery_food/services/Products_service.dart';
import 'package:get/state_manager.dart';

class ProductsController extends GetxController {
  var products = <ProductsResponse>[];
  var hasError = true;
  var massage = '';
  ApiResult apiResult = ApiResult();
  ProductService product = ProductService();
  // String query = '';

  @override
  void onInit() {
    // getproduct('', 0, 8, query);
    super.onInit();
  }

  getproduct(
    String subCategoryId,
    int offset,
    int limit,
    String q,
  ) async {
    try {
      apiResult = (await product.getproductsData(
        subCategoryId,
        offset,
        limit,
        q,
      ))!;
      if (!apiResult.hasError!) {
        products = apiResult.data;
        hasError = apiResult.hasError!;
        update();
        print(products);
      } else {
        hasError = apiResult.hasError!;
        massage = apiResult.errorMassage!;
        update();
      }
    } catch (e) {
      hasError = apiResult.hasError!;
      massage = apiResult.errorMassage!;
      update();

      print(e);
    }
  }
}
