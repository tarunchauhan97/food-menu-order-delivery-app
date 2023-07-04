import 'package:foodmenuorder/models/product_model.dart';
import 'package:foodmenuorder/service/get_protein_service.dart';
import 'package:get/get.dart';

class ProteinListingController extends GetxController {
  List<ProductModel> getProteinListings = <ProductModel>[].obs;
  final isLoading = true.obs;

  fetchProductDetails(String apiPath) async {
    try {
      await GetProteinFoods().getProteinListing(apiPath).then(
        (product) {
          getProteinListings.addAll(product);
        },
      );
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
