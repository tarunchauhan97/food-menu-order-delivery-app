import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox button({
  required BuildContext context,
  required String title,
  required Function onClick,
  isFloatingButton = false,
}) {
  return SizedBox(
    height: 70.h,
    width: MediaQuery.of(context).size.width,
    child: GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    ),
  );
}
