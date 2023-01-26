import 'package:foodonwheel/service/add_product_detail_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddProductController extends GetxController {
  Future<bool> addProduct(
      {required String productName,
      required String productPrice,
      required String image}) async {
    late bool isSave;
    isSave = AddProductDetailService().addProuctDetails(
      productName: productName,
      productPrice: productPrice,
      image: image,
    );
    return isSave;
  }
}
