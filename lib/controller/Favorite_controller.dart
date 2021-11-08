import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Favorite_model.dart';
import 'package:delivery_food/services/Favorite_services.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favorites = <FavoriteResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  FavoriteService favoriteService = FavoriteService();

  @override
  void onInit() {
    getfavorite();
    super.onInit();
  }

  getfavorite() async {
    try {
      apiResult = await favoriteService.getfavoriteData();
      if (!apiResult.hasError!) {
        favorites.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        print(favorites[0].id);
      } else {
        hasError.value = apiResult.hasError!;
        massage.value = apiResult.errorMassage!;
      }
    } finally {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
    }
  }
}
