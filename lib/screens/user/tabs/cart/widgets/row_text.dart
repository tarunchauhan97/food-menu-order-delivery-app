import 'package:flutter/material.dart';
import 'package:foodmenuorder/theme/text_style_util.dart';

class RowText extends StatelessWidget {
  final String price, rowTitle;
  const RowText({
    Key? key,
    required this.rowTitle,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(rowTitle.toString(), style: TextStyleUtil.txt18()),
        Text(
          price.toString(),
          textAlign: TextAlign.center,
          style: TextStyleUtil.txt20(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
