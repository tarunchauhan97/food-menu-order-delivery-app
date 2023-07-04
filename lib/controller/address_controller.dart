import 'package:foodmenuorder/models/address_mock_model.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var listOfAddress = <AddressMockModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAddressAll();
  }

  fetchAddressAll() {
    for (var address in AddressMockData.addressMockData) {
      listOfAddress.add(AddressMockModel.fromJson(address));
    }
  }

  addAddressNew(Map<String, String> addressData) {
    listOfAddress.add(AddressMockModel.fromJson(addressData));
  }
}
