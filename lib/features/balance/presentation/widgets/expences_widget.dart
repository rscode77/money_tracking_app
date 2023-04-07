import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_constants.dart';

class ExpencesWidget extends StatelessWidget {
  const ExpencesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
              'Grocery',
              style: GoogleFonts.darkerGrotesque(
                height: 1.h,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(3.h),
            Text(
              '10 min ago',
              style: GoogleFonts.darkerGrotesque(
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
          '- \$35',
          style: GoogleFonts.darkerGrotesque(
            height: 1.h,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
