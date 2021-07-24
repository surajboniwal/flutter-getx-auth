import 'package:flutter/material.dart';
import 'package:flutter_getx/global/values/values.dart';

class InputFieldBorder extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  const InputFieldBorder({
    Key? key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.BLUE_COLOR,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
        style: TextStyle(
          color: AppColors.BLUE_COLOR,
          fontSize: 14.5,
        ),
      ),
    );
  }
}
