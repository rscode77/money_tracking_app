import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../constants/app_constants.dart';

class YourCardsWidget extends StatelessWidget {
  final String lastFourDigit;
  final String name;
  final int id;
  final double value;

  const YourCardsWidget({
    Key? key,
    required this.lastFourDigit,
    required this.name,
    required this.id,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: mainGray,
          ),
          child: Row(
            children: [
              Gap(12.w),
              Container(
                height: 35.h,
                width: 60.w,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text('· · · · $lastFourDigit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'DarkGrotesque',
                        height: 1.h,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      )),
                ),
              ),
              Gap(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$$value',
                    style: TextStyle(
                      fontFamily: 'DarkGrotesque',
                      height: 1.h,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'DarkGrotesque',
                      color: textGray,
                      height: 1.h,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(8.h),
      ],
    );
  }
}
