import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/Delete.dart';
import 'package:delivery_food/model/Favorite_model.dart';
import 'package:delivery_food/model/Post_data.dart';
import 'package:delivery_food/services/Favorite_services.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favorites = <FavoriteResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  var postFavorite = PostResponse().obs;
  var deleteFavorite = DeleteResponse().obs;
  var isLoading = true.obs;
  var opensearch = false.obs;
  var idcategory = 0.obs;
  var idsupcategory = 0.obs;
  var isEmpty = false.obs;

  ApiResult apiResult = ApiResult();
  FavoriteService favoriteService = FavoriteService();

  @override
  void onInit() {
    //  getfavorite(0, 8);
    super.onInit();
  }

  getfavorite(String q, String from, String to) async {
    favorites = <FavoriteResponse>[].obs;
    try {
      apiResult = await favoriteService.getfavoriteData(q, from, to);
      if (!apiResult.hasError!) {
        isEmpty.value = apiResult.isEmpty;

        favorites.value = apiResult.data;
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

  deleteFavorites(int id) async {
    try {
      apiResult = await favoriteService.deletefavoriteData(id);
      if (!apiResult.hasError!) {
        deleteFavorite.value = apiResult.data;
        hasError.value = apiResult.hasError!;
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
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
          });
    }
  }

  addFavorite(int id) async {
    print('[[[[[[[[[[[[[[object]]]]]]]]]]]]]]');

    try {
      apiResult = await favoriteService.postfavoriteData(id);
      if (!apiResult.hasError!) {
        postFavorite.value = apiResult.data;
        hasError.value = apiResult.hasError!;
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
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
          });
    }
  }
}
