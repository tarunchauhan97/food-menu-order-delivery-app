import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmenuorder/theme/text_style_util.dart';

SizedBox newButtonAddress({
  required BuildContext context,
  required String title,
  required Function onClick,
  required double buttonHeight,
  required double buttonWidth,
  required Color buttonContainerColor,
  double buttonRadius = 10,
}) {
  return SizedBox(
    child: GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        height: buttonHeight.h,
        width: buttonWidth.w,
        decoration: BoxDecoration(
          color: buttonContainerColor,
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyleUtil.txt20(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            // fontTextSize: buttonTitleSize,
            // fontTextColor: Colors.white,
            // fontTextWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
