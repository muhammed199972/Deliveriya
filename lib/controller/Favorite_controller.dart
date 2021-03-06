import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/DeletePutPost.dart';
import 'package:delivery_food/model/Favorite_model.dart';
import 'package:delivery_food/services/Favorite_services.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favorites = <FavoriteResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  var postFavorite = DeletePutPostResponse().obs;
  var deleteFavorite = DeletePutPostResponse().obs;
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
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          isEmpty.value = apiResult.isEmpty;

          favorites.value = apiResult.data;
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
      } else {
        getfavorite(q, from, to);
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
      if (apiResult.rfreshToken) {
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
      } else {
        deleteFavorites(id);
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
    try {
      apiResult = await favoriteService.postfavoriteData(id);
      if (apiResult.rfreshToken) {
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
      } else {
        addFavorite(id);
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
