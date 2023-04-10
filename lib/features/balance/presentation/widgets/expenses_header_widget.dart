import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracking_app/route.dart';

import '../../../../constants/app_constants.dart';

class ExpencesHeaderWidget extends StatelessWidget {
  const ExpencesHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Expences',
          style: TextStyle(
            fontFamily: 'DarkGrotesque',
            height: 1.h,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        InkWell(
          onTap: () => Navigator.pushNamed(context, allExpences),
          child: Container(
            width: 60.w,
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(
                style: BorderStyle.solid,
                width: 1,
                color: borderGray,
              ),
            ),
            child: Center(
              child: Text(
                'View all',
                style: TextStyle(
                  fontFamily: 'DarkGrotesque',
                  height: 1.h,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
