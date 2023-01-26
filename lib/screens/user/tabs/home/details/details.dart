import 'package:flutter/material.dart';
import 'package:foodonwheel/models/product_model.dart';
import 'package:foodonwheel/screens/user/tabs/home/details/widgets/body_detailes.dart';

class Details extends StatelessWidget {
  final int? index;
  final ProductModel product;
  const Details({Key? key, this.index, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'detail_food$index',
            child: Container(
              alignment: Alignment.topCenter,
              width: size.width,
              height: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(product.image!), fit: BoxFit.fill),
              ),
            ),
          ),
          BodyDetails(screenArguments: product, index: index!)
        ],
      ),
    );
  }
}
