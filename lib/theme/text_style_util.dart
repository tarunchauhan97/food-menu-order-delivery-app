import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_util.dart';

class TextStyleUtil {
  static TextStyle txt15({
    Color? color = ColorsUtils.grey500,
    FontWeight? fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      letterSpacing: 0.5,
      fontWeight: fontWeight,
      fontSize: 15.5.sp,
      color: color,
    );
  }

  static TextStyle txt18({
    Color? color = ColorsUtils.grey500,
    FontWeight? fontWeight = FontWeight.w400,
  }) {
    return TextStyle(fontSize: 18.sp, height: 1, color: color,fontWeight: fontWeight);
  }

  static TextStyle txt20({
    Color? color = ColorsUtils.grey500,
    FontWeight? fontWeight = FontWeight.w400,
  }) {
    return TextStyle(fontSize: 20.sp, height: 1, color: color,fontWeight: fontWeight);
  }

  static TextStyle txt24({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: 24.sp,
      color: color,
    );
  }
}
