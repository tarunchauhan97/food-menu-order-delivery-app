import 'package:flutter/material.dart';
import 'package:foodonwheel/controller/get_product_details.dart';
import 'package:foodonwheel/screens/user/tabs/cart/order_summary.dart';
import 'package:get/get.dart';

class CustomHeader extends StatelessWidget {
  final int quantity;
  final String title;
  final bool internalScreen;
  final bool showCart;
  final IconData? iconData;

  const CustomHeader({
    Key? key,
    required this.quantity,
    required this.title,
    required this.internalScreen,
    this.showCart = true,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        (internalScreen)
            ? GestureDetector(
                onTap: () {
                  if (iconData != null) {
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Icon(iconData ?? Icons.arrow_back_ios, size: 28.0),
                ),
              )
            : const Icon(
                Icons.arrow_back_ios,
                size: 28.0,
                color: Colors.transparent,
              ),
        Text(
          title,
          style: const TextStyle(fontSize: 18.0),
        ),
        showCart
            ? Stack(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Get.to(() => const OrderSummary());
                    },
                  ),
                  Get.find<ProductDetailsController>().cartProductModel.isEmpty
                      ? Container()
                      : Positioned(
                          child: Stack(
                          children: <Widget>[
                            Icon(Icons.brightness_1, size: 20.0, color: theme.primaryColor),
                            Positioned(
                                top: 1.0,
                                right: 1.0,
                                left: 1.0,
                                bottom: 1.0,
                                child: Center(
                                  child: Text(
                                    Get.find<ProductDetailsController>()
                                        .cartProductModel
                                        .length
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ],
                        )),
                ],
              )
            : Container(),
      ],
    );
  }
}
