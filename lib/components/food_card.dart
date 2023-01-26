import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodonwheel/config/location.dart';
import 'package:foodonwheel/models/product_model.dart';
import 'package:get/get.dart';

class FoodCard extends StatelessWidget {
  final double width;
  final Color primaryColor;
  final ProductModel productModel;

  // final int index;

  const FoodCard({
    required this.width,
    required this.primaryColor,
    required this.productModel,
    // required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: width,
        color: Colors.white,
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 2),
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 140.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(productModel.image.toString()),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      productModel.isLike(!productModel.isLike.value);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4.0,
                            offset: const Offset(3.0, 3.0),
                          )
                        ],
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        size: 17.0,
                        color: productModel.isLike.value ? primaryColor : Colors.grey.shade300,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
                bottom: 2.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 120.w,
                    child: Text(
                      productModel.name.toString(),
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Location.openMap(28.474388, 77.503990);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration:
                          BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4.0,
                          offset: const Offset(3.0, 3.0),
                        )
                      ]),
                      child: Icon(
                        Icons.near_me,
                        size: 17.0,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    productModel.rate.toString(),
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    '₹ ' + productModel.price.toString(),
                    style: const TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
