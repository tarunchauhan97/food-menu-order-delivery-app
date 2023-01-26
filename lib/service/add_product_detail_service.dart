import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class AddProductDetailService {
  DatabaseReference postListRef = FirebaseDatabase.instance.ref("Dish");

  addProuctDetails(
      {required String productName,
      required String productPrice,
      required String image,
      String rate = '4.6',
      String clients = '10'}) async {
    bool isProductSave = false;
    try {
      http.Response a = await http.get(Uri.parse(
          "https://foodonwheel-a6a34-default-rtdb.firebaseio.com/.json"));
      var response = json.decode(a.body);
      List<dynamic> data = response == null ? [] : response['Dish'];

      await postListRef.child((data.length).toString()).set({
        'name': productName,
        'price': productPrice,
        'image': image,
        'rate': rate,
        'clients': clients,
      });
      isProductSave = true;
    } catch (e) {
      print(e);
    }
    return isProductSave;
  }
}
