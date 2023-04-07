import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:money_tracking_app/constants/app_constants.dart';

import '../widgets/current_balance_widget.dart';
import '../widgets/expences_widget.dart';
import '../widgets/expenses_header_widget.dart';
import '../widgets/incoming_spent_widget.dart';
import '../widgets/user_header_widget.dart';
import '../widgets/your_cards_header_widget.dart';
import '../widgets/your_cards_widget.dart';

class BallanceView extends StatefulWidget {
  const BallanceView({super.key});

  @override
  State<BallanceView> createState() => _BallanceViewState();
}

class _BallanceViewState extends State<BallanceView> {
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
              const UserHeaderWidget(),
              Gap(40.h),
              const CurrentBalanceWidget(),
              Gap(20.h),
              const IncomingSpentWidget(),
              Gap(20.h),
              const YourCardsHeaderWidget(),
              Gap(8.h),
              const YourCardsWidget(),
              Gap(20.h),
              const ExpencesHeaderWidget(),
              Gap(5.h),
              const ExpencesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
