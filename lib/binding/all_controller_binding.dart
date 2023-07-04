import 'package:foodmenuorder/controller/address_controller.dart';
import 'package:foodmenuorder/controller/auth_controller.dart';
import 'package:foodmenuorder/controller/cart_controller.dart';
import 'package:foodmenuorder/controller/get_product_details.dart';
import 'package:foodmenuorder/controller/protein_controller.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => ProteinListingController(), fenix: true);
    Get.lazyPut(() => AddressController(),fenix: true);
  
  }
}
