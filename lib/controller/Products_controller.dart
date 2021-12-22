import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/Favorite_model.dart';
import 'package:delivery_food/model/Products_model.dart';
import 'package:delivery_food/services/Products_service.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  var products = <ProductsResponse>[].obs;
  var prods = <FavoriteResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  var isLoading = true.obs;
  var isEmpty = false.obs;
  List cartscounte = [].obs;
  List cartsid = [].obs;
  List cartscountupdate = [];
  List cartsdeleteupdate = [];
  List cartsdeletesupupdate = [];
  List cartsdeletecatupdate = [];
  var isTotal = true.obs;

  ApiResult apiResult = ApiResult();
  ProductService product = ProductService();

  @override
  void onInit() async {
    cartscounte = await Constansbox.box.read('cartscounte');
    cartsid = await Constansbox.box.read('cartsid');

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

  getListproduct(
      {List<int>? Listproduct, String? q, String? from, String? to}) async {
    try {
      prods = <FavoriteResponse>[].obs;
      apiResult =
          (await product.getListproductsData(Listproduct!, q!, from!, to!))!;
      if (!apiResult.hasError!) {
        isEmpty.value = apiResult.isEmpty;
        prods.value = apiResult.data;
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
