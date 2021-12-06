import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/Products_model.dart';
import 'package:delivery_food/services/Products_service.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  var products = <ProductsResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  var isLoading = true.obs;

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

  getListproduct({
    int? offset,
    int? limit,
    List<int>? Listproduct,
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

  //====================infinty scroll=====================
  // var scrollController = new ScrollController().obs;

  // int currentPage = 1;

  // bool onNotificatin(
  //   ScrollNotification notification,
  //   String? subCategoryId,
  //   int? offset,
  //   int? limit,
  //   String? q,
  // ) {
  //   if (notification is ScrollUpdateNotification) {
  //     if (scrollController.value.position.maxScrollExtent >
  //             scrollController.value.offset &&
  //         scrollController.value.position.maxScrollExtent -
  //                 scrollController.value.offset <=
  //             10) {
  //       print('End Scroll');
  //       product
  //           .getproductsData(
  //         subCategoryId!,
  //         offset!,
  //         limit!,
  //         q!,
  //       )
  //           .then((val) {
  //         currentPage ++;

  //           products.addAll(val.data?);
  //         });
  //       });
  //     }
  //   }
  //   return true;
  // }
}
