import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../blocs/card/card_bloc.dart';
import '../../blocs/expences/expences_bloc.dart';

class CurrentBalanceWidget extends StatelessWidget {
  const CurrentBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current ballance',
          style: TextStyle(
            fontFamily: 'DarkGrotesque',
            //set text height becouse this font have huge spacing
            height: 1.h,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(8.h),
        BlocBuilder<ExpencesBloc, ExpencesState>(
          builder: (context, expencesState) {
            return BlocBuilder<CardBloc, CardState>(
              builder: (context, cardState) {
                return Text(
                  '\$ ${cardState.income - expencesState.spent}',
                  style: TextStyle(
                    fontFamily: 'DarkGrotesque',
                    //set text height becouse this font have huge spacing
                    height: 1.h,
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            );
          },
        )
      ],
    );
  }
}
