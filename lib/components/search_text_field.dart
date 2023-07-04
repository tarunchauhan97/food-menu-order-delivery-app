import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:foodmenuorder/constants/api_path_constant.dart';
import 'package:foodmenuorder/models/product_model.dart';
import 'package:foodmenuorder/screens/user/tabs/home/details/details.dart';
import 'package:foodmenuorder/service/search_listings.dart';
import 'package:foodmenuorder/theme/color_util.dart';
import 'package:foodmenuorder/theme/text_style_util.dart';
import 'package:get/get.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController typeAheadController = TextEditingController();
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focus) => setState(() {
        active = focus;
      }),
      autofocus: false,
      child: TypeAheadField(
        keepSuggestionsOnLoading: false,
        minCharsForSuggestions: 4,
        hideSuggestionsOnKeyboardHide: false,
        textFieldConfiguration: TextFieldConfiguration(
          style: TextStyleUtil.txt15(),
          controller: typeAheadController,
          decoration: InputDecoration(
            hintText: active ? APIPath.DISH : "Search Food",
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 19.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorsUtils.themeColor, width: 1.0),
            ),
            prefixIcon: const Icon(
              Icons.search,
              size: 28.0,
              color: ColorsUtils.themeColor,
            ),
            suffixIcon: active == false
                ? const Icon(
                    Icons.filter_list,
                    size: 28.0,
                    color: ColorsUtils.themeColor,
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        typeAheadController.text = "";
                        active = false;
                      });
                    },
                    child: const Icon(
                      Icons.cancel,
                      size: 28.0,
                      color: ColorsUtils.themeColor,
                    ),
                  ),
          ),
        ),
        suggestionsCallback: (pattern) async {
          return SearchFoodListings().getFoodListingsMap(pattern.trim());
        },
        itemBuilder: (context, Map<String, String> foodListing) {
          // print("Image Searched:${foodListing['image']}");
          return ListTile(
            title: Text(foodListing['name'].toString().capitalizeFirst ?? ""),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Image.network(
                foodListing['image']!,
                fit: BoxFit.fill,
              ),
            ),
            trailing: Text('₹' + (foodListing['price'].toString().capitalizeFirst ?? "")),
          );
        },
        onSuggestionSelected: (Map<String, String> selectFood) {
          typeAheadController.clear();
          final ProductModel productModel = ProductModel.from(selectFood);
          Get.to(() => Details(product: productModel, index: 0));
        },
      ),
    );
  }
}
