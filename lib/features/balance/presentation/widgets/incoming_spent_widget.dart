import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../constants/app_constants.dart';
import '../../blocs/card/card_bloc.dart';
import '../../blocs/expences/expences_bloc.dart';

class IncomingSpentWidget extends StatelessWidget {
  const IncomingSpentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.h,
      decoration: BoxDecoration(
        color: mainBlue,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gap(30.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Income',
                style: TextStyle(
                  fontFamily: 'DarkGrotesque',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              BlocBuilder<CardBloc, CardState>(
                builder: (context, state) {
                  return Text(
                    '\$ ${state.income}',
                    style: const TextStyle(
                      fontFamily: 'DarkGrotesque',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ],
          ),
          Gap(40.w),
          Container(
            width: 1.w,
            height: 35.h,
            color: spacerColor,
          ),
          Gap(40.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Spent',
                style: TextStyle(
                  fontFamily: 'DarkGrotesque',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              BlocBuilder<ExpencesBloc, ExpencesState>(
                builder: (context, state) {
                  return Text(
                    '\$ ${state.spent}',
                    style: const TextStyle(
                      fontFamily: 'DarkGrotesque',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
