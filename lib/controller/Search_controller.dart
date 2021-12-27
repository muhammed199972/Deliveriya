import 'package:delivery_food/General/Constants.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var SearchHome = [].obs;
  @override
  void onInit() async {
    var Search = Constansbox.box.read('SearchHome');
    SearchHome.value = new List.from(Search.reversed);
    super.onInit();
  }
}
