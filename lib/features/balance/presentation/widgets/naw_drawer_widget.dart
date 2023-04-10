import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:money_tracking_app/constants/app_constants.dart';
import 'package:money_tracking_app/features/balance/presentation/widgets/balance_custom_button_widget.dart';
import 'package:money_tracking_app/route.dart';

class NavDrawerWidget extends StatelessWidget {
  const NavDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: backgroundColor,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  Gap(20.w),
                  Text(
                    'Menu',
                    style: TextStyle(
                      fontFamily: 'DarkGrotesque',
                      //set text height becouse this font have huge spacing
                      height: 1.h,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Gap(40.h),
              BalanceCustomButtonWidget(
                text: 'Add new card',
                onPressed: () => Navigator.pushNamed(context, newCard),
                color: black,
              ),
              Gap(15.h),
              BalanceCustomButtonWidget(
                text: 'Add new expence',
                onPressed: () => Navigator.pushNamed(context, newExpence),
                color: mainBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
