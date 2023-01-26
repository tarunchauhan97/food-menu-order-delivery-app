import 'package:flutter/material.dart';
import 'package:foodonwheel/controller/get_product_details.dart';
import 'package:foodonwheel/models/product_model.dart';
import 'package:foodonwheel/theme/color_util.dart';
import 'package:get/get.dart';

Widget cartCard({
  required ProductModel food,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      side: BorderSide(
        width: 1,
        color: Colors.grey.shade300,
      ),
    ),
    child: Row(
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(food.image!),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Get.find<ProductDetailsController>().cartProductModel.remove(food);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text(food.name!), const Icon(Icons.delete_outline)],
                  ),
                ),
                Text('₹ ${food.price}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5), color: ColorsUtils.themeColor),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                if (food.quantity > 1) {
                                  food.quantity--;
                                }
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 16,
                              )),
                          const SizedBox(width: 6),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3), color: Colors.white),
                            child: Obx(() => Text(
                                  food.quantity.toString(),
                                )),
                          ),
                          const SizedBox(width: 6),
                          InkWell(
                              onTap: () {
                                food.quantity++;
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
