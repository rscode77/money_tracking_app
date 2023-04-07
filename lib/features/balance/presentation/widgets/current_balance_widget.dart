import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentBalanceWidget extends StatelessWidget {
  const CurrentBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current ballance',
          style: GoogleFonts.darkerGrotesque(
            //set text height becouse this font have huge spacing
            height: 1.h,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(8.h),
        Text(
          '\$ 2,090.20',
          style: GoogleFonts.darkerGrotesque(
            //set text height becouse this font have huge spacing
            height: 1.h,
            fontSize: 45,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
