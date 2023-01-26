import 'package:get/get.dart';

class ProductModel {
  String? name;
  String? price;
  String? rate;
  String? clients;
  String? image;
  String? about;
  var isLike = false.obs;
  var quantity = 1.obs;
  bool? veg;

  ProductModel(
      {this.name,
      this.price,
      this.clients,
      this.image,
      this.rate,
      this.about,
      this.veg});

  factory ProductModel.from(Map<String, dynamic> map) {
    return ProductModel(
        clients: map['clients'],
        image: map['image'],
        name: map['name'],
        price: map['price'],
        rate: map['rate'],
        about: map['about'],
        veg: map['veg']);
  }

  static Map<String, String> toJson(ProductModel productModel) {
    return {
      "name": productModel.name!,
      "image": productModel.image!,
      "price": productModel.price!,
      "clients": productModel.clients!,
      "about": productModel.about!,
      "rate": productModel.rate!,
    };
  }
}
