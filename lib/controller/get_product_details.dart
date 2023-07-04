import 'package:foodmenuorder/models/product_model.dart';
import 'package:foodmenuorder/service/get_product_service.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  List<ProductModel> listProduct = <ProductModel>[].obs;
  List<ProductModel> cartProductModel = <ProductModel>[].obs;
  List<ProductModel> orderProductModel = <ProductModel>[].obs;
  final isLoading = true.obs;
  var orderType = 'Dine-In'.obs;

  var orderTime = 'ASAP'.obs;

  double get cartAmount => cartProductModel.fold(0, (sum, productModel) {
        return sum += double.parse(productModel.price!);
      });

  double get cartTotalAmount {
    if (cartAmount == 0.0) {
      return 0.0;
    }
    return cartAmount + ((cartAmount * 18) / 100) + 40;
  }

  @override
  void onInit() {
    super.onInit();
    fetchProductDetails();
  }

  void fetchProductDetails() async {
    try {
      await GetProductService().getProduct().then((product) {
        listProduct.addAll(product);
      });
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
