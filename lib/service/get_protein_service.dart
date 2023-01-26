import 'dart:async';
import 'dart:convert';
import 'package:foodonwheel/constants/api_path_constant.dart';
import 'package:foodonwheel/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetProteinFoods {
  Future<List<ProductModel>> getProteinListing(String apiPath) async {
    List<ProductModel> getProteinListings = [];
    try {
      http.Response a = await http.get(Uri.parse(
          "https://foodonwheel-a6a34-default-rtdb.firebaseio.com/.json"));
      var response = json.decode(a.body);
      List<dynamic> productList = response[apiPath];
      print(apiPath);
      for (var product in productList) {
        ProductModel _productModel = ProductModel.from(product);
        getProteinListings.add(_productModel);
      }
    } catch (e) {
      print(e);
    }
    return getProteinListings;
  }
}
