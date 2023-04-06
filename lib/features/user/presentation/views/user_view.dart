import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_tracking_app/constants/app_constants.dart';
import 'package:money_tracking_app/features/user/presentation/widgets/current_balance_widget.dart';

import '../widgets/incoming_spent_widget.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.menu),
                Icon(Icons.person_outlined),
              ],
            ),
            Gap(40.h),
            const CurrentBalance(),
            Gap(20.h),
            const IncomingSpentWidget(),
            Gap(20.h),
            Text(
              'Your cards',
              style: GoogleFonts.darkerGrotesque(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            Gap(8.h),
            Container(
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: mainGray,
              ),
            )
          ],
        ),
      )),
    );
  }
}
