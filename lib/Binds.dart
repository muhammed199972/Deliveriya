import 'package:delivery_food/controller/Ads_controller.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Category_controller.dart';
import 'package:delivery_food/controller/Offer_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/controller/Statuses_all.dart';
import 'package:delivery_food/controller/Subcategory_controller.dart';
import 'package:get/get.dart';

class Binds extends Bindings {
  @override
  void dependencies() {
    Get.put(CategorysController(), permanent: true);
    Get.put(SubcategorysControllers());
    Get.put(CartController());
    Get.put(StatusesController());
    Get.put(OfferController());
    Get.put(AdssController());
    Get.put(ProductsController());
  }
}
