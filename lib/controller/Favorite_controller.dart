import 'package:delivery_food/General/Api_Result.dart';
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

  ApiResult apiResult = ApiResult();
  FavoriteService favoriteService = FavoriteService();

  @override
  void onInit() {
    //  getfavorite(0, 8);
    super.onInit();
  }

  getfavorite(int offset, int limit) async {
    try {
      apiResult = await favoriteService.getfavoriteData(offset, limit);
      if (!apiResult.hasError!) {
        favorites.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        print(favorites.value);
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
      }
    } finally {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
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
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      print(e);
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
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      print(e);
    }
  }
}
