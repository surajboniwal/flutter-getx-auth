import 'package:flutter/material.dart';
import 'package:flutter_getx/global/values/values.dart';

class OrSeperator extends StatelessWidget {
  const OrSeperator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1.0,
            width: 30.0,
            margin: EdgeInsets.symmetric(horizontal: 12.0),
            color: AppColors.PRIMARY_COLOR,
          ),
          Text('OR'),
          Container(
            height: 1.0,
            width: 30.0,
            margin: EdgeInsets.symmetric(horizontal: 12.0),
            color: AppColors.PRIMARY_COLOR,
          ),
        ],
      ),
    );
  }
}
