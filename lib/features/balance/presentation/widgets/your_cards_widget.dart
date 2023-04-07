import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_constants.dart';

class YourCardsWidget extends StatelessWidget {
  const YourCardsWidget({super.key});

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
                  child: Text('· · · · 3490',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.darkerGrotesque(
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
                    '\$1,020.92',
                    style: GoogleFonts.darkerGrotesque(
                      height: 1.h,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Visa',
                    style: GoogleFonts.darkerGrotesque(
                      color: textGray,
                      height: 1.h,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20.h,
              ),
              Gap(14.w),
            ],
          ),
        ),
      ],
    );
  }
}
