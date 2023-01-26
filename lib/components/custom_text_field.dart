import 'package:flutter/material.dart';

TextField customTextField({
  required String hintText,
  required TextEditingController textEditingController,
}) {
  return TextField(
    controller: textEditingController,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1)),
      hintText: hintText,
    ),
  );
}
