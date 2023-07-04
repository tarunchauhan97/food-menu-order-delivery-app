import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:foodmenuorder/theme/color_util.dart';
import 'package:foodmenuorder/theme/text_style_util.dart';

TextButton customTextButton({
  required String textButtonTitle,
  required Color textButtonColor,
  required Function textButtonClick,
}) {
  return TextButton(
      onPressed: () => textButtonClick(),
      child: Text(
        textButtonTitle,
        style: TextStyleUtil.txt20(color: textButtonColor),
        // fontTextSize: buttonTextSize,
        // fontTextColor: textButtonColor,
      ));
}
