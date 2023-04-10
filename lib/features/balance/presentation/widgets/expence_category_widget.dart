import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_constants.dart';

class ExpenceCategoryWidget extends StatefulWidget {
  final TextEditingController controller;
  const ExpenceCategoryWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ExpenceCategoryWidget> createState() => _ExpenceCategoryWidgetState();
}

class _ExpenceCategoryWidgetState extends State<ExpenceCategoryWidget> {
  final List<String> categoryList = ['Grocery', 'Shopping', 'Transport', 'Bills'];
  late String dropDownValue;

  @override
  void initState() {
    dropDownValue = categoryList[0];
    widget.controller.text = dropDownValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Category',
            style: TextStyle(
              fontFamily: 'DarkGrotesque',
              fontSize: 18,
              height: 1.h,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: 60.h,
          width: double.infinity,
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropDownValue,
            style: TextStyle(
              fontFamily: 'DarkGrotesque',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: black,
            ),
            underline: Container(
              height: 1,
              color: dropDownFieldLine,
            ),
            onChanged: (String? value) {
              setState(() {
                widget.controller.text = value!;
                dropDownValue = value;
              });
            },
            items: categoryList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
