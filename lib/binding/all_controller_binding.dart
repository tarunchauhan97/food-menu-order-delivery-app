import 'package:foodonwheel/controller/address_controller.dart';
import 'package:foodonwheel/controller/auth_controller.dart';
import 'package:foodonwheel/controller/cart_controller.dart';
import 'package:foodonwheel/controller/get_product_details.dart';
import 'package:foodonwheel/controller/protein_controller.dart';
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
