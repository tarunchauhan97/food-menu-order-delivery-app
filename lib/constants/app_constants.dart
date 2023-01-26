// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

abstract class AppConstants {
  static const String APP_NAME = "Food on Wheel";
}

mediaWidth(BuildContext context, double value) {
  return MediaQuery.of(context).size.width * (value);
}

mediaHeight(BuildContext context, double value) {
  return MediaQuery.of(context).size.height * (value);
}