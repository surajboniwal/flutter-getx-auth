import 'package:flutter/material.dart';
import 'package:flutter_getx/global/values/values.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.isBordered = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final bool isBordered;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: isBordered ? Colors.transparent : AppColors.TEAL_COLOR,
        elevation: isBordered ? 0 : 4,
        side: BorderSide(
          width: isBordered ? 1.0 : 0,
          color: AppColors.BLUE_COLOR,
        ),
        shadowColor: isBordered ? Colors.transparent : Colors.grey[300],
      ),
      child: Container(
        width: double.maxFinite,
        height: 45.0,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isBordered ? AppColors.BLUE_COLOR : AppColors.WHITE_COLOR,
            ),
          ),
        ),
      ),
    );
  }
}
