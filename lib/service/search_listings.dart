import 'dart:convert';
import 'package:foodmenuorder/constants/api_path_constant.dart';
import 'package:http/http.dart' as http;

class SearchFoodListings {
  Future<List<Map<String, String>>> getFoodListingsMap(String searchValue) async {
    List<String> listingPaths = [
      APIPath.DISH,
      APIPath.DISH_BURGER,
      APIPath.DISH_FASTFOOD,
      APIPath.DISH_PROTEINS,
      APIPath.DISH_SALADS
    ];
    List<Map<String, String>> foodsMapList = [];
    List<Map<String, String>> newListSearch = [];
    try {
      http.Response a =
          await http.get(Uri.parse("https://foodmenuorder-a6a34-default-rtdb.firebaseio.com/.json"));
      var response = json.decode(a.body);
      for (String apiPath in listingPaths) {
        List<dynamic> foodsTypeList = response[apiPath];
        for (Map<String, dynamic> foods in foodsTypeList) {
          foodsMapList.add({
            "clients": foods['clients'].toString().toLowerCase(),
            "image": foods['image'].toString(),
            "name": foods['name'].toString().toLowerCase(),
            "price": foods['price'].toString().toLowerCase(),
            "rate": foods['rate'].toString().toLowerCase(),
            "about": foods['about'].toString().toLowerCase(),
          });
        }
      }

      for (Map<String, String> foodMap in foodsMapList) {
        for (String key in foodMap.keys) {
          if (key == 'name') {
            // print("name: ${foodMap[key]}");
            if (foodMap[key]!.contains(searchValue.toLowerCase())) {
              newListSearch.add(foodMap);
            }
          }
        }
      }

      return newListSearch;
    } catch (e) {
      print(e);
    }
    return newListSearch;
  }
}
