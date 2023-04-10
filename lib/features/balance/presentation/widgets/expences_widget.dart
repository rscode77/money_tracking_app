import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../constants/app_constants.dart';

class ExpencesWidget extends StatelessWidget {
  final int id;
  final String category;
  final String time;
  final double value;

  const ExpencesWidget({
    Key? key,
    required this.id,
    required this.category,
    required this.time,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Container(
            height: 55.h,
            width: 55.h,
            decoration: BoxDecoration(
              color: mainGray,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: const Icon(Icons.local_grocery_store),
          ),
          Gap(14.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: TextStyle(
                  fontFamily: 'DarkGrotesque',
                  height: 1.h,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gap(3.h),
              Text(
                time,
                style: TextStyle(
                  fontFamily: 'DarkGrotesque',
                  height: 1.h,
                  color: textGray,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '- \$$value',
            style: TextStyle(
              fontFamily: 'DarkGrotesque',
              height: 1.h,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
