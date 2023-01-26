import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String text;
  final ValueChanged<T?> onChanged;

  const MyRadioOption({
    Key? key,
    required this.value,
    this.groupValue,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      width: 18.w,
      height: 18.h,
      padding: isSelected ? const EdgeInsets.all(1.5) : null,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.red.shade300,
          ),
        ),
      ),
      child: Container(
        decoration: ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(
              color: Colors.red.shade300,
            ),
          ),
          color: isSelected ? Colors.red.shade300 : Colors.white,
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      text,
      style: const TextStyle(fontSize: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, right: 15, left: 15),
      child: Row(
        children: [
          InkWell(
            child: _buildLabel(),
            onTap: () => onChanged(value),
          ),
          const SizedBox(width: 10),
          _buildText(),
        ],
      ),
    );
  }
}
