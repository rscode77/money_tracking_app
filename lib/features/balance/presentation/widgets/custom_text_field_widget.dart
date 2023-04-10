import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_constants.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType textInputType;

  const CustomTextField({
    Key? key,
    required this.title,
    required this.hint,
    required this.textEditingController,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'DarkGrotesque',
              fontSize: 18,
              height: 1.h,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        TextField(
          keyboardType: textInputType,
          controller: textEditingController,
          style: TextStyle(
            fontFamily: 'DarkGrotesque',
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: black,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: 'DarkGrotesque',
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: textGray,
            ),
          ),
        ),
      ],
    );
  }
}
