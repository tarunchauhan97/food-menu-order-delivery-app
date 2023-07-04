import 'dart:async';
import 'dart:convert';
import 'package:foodmenuorder/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetProductService {
  Future<List<ProductModel>> getProduct() async {
    List<ProductModel> productModel = [];
    try {
      http.Response a = await http.get(Uri.parse(
          "https://foodmenuorder-a6a34-default-rtdb.firebaseio.com/.json"));
      var response = json.decode(a.body);
      List<dynamic> productList = response['Dish'];
      for (var product in productList) {
        ProductModel _productModel = ProductModel.from(product);
        productModel.add(_productModel);
      }
    } catch (e) {
      print(e);
    }
    return productModel;
  }
}
