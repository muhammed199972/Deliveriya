import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/model/Address.dart';
import 'package:delivery_food/services/Address_services.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var address = <AddressResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  var isLoading = true.obs;
  ApiResult apiResult = ApiResult();
  AddressService addressService = AddressService();

  @override
  void onInit() {
    getaddress();
    super.onInit();
  }

  getaddress() async {
    try {
      apiResult = await addressService.getaddressData();
      if (!apiResult.hasError!) {
        address.value = apiResult.data;
        hasError.value = apiResult.hasError!;
        isLoading.value = false;
        print(address[0].id);
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
