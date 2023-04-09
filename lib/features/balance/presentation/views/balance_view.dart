import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:money_tracking_app/constants/app_constants.dart';

import '../../../user/blocs/user/user_bloc.dart';
import '../../blocs/card/card_bloc.dart';
import '../../blocs/expences/expences_bloc.dart';
import '../widgets/current_balance_widget.dart';
import '../widgets/expences_widget.dart';
import '../widgets/expenses_header_widget.dart';
import '../widgets/incoming_spent_widget.dart';
import '../widgets/user_header_widget.dart';
import '../widgets/your_cards_header_widget.dart';
import '../widgets/your_cards_widget.dart';

class BalanceView extends StatefulWidget {
  const BalanceView({super.key});

  @override
  State<BalanceView> createState() => _BalanceViewState();
}

class _BalanceViewState extends State<BalanceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (BuildContext context) => ExpencesBloc()
                    ..add(
                      GetExpencesEvent(
                        user: userState.user!,
                        database: userState.database!,
                      ),
                    ),
                ),
                BlocProvider(
                  create: (BuildContext context) => CardBloc(),
                ),
              ],
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
                    BlocBuilder<ExpencesBloc, ExpencesState>(
                      builder: (context, expencesState) {
                        return SizedBox(
                          height: 200,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              var expence = expencesState.userExpences[index];
                              return ExpencesWidget(
                                category: expence.category,
                                id: expence.id,
                                time: expence.time,
                                value: expence.value,
                              );
                            },
                            itemCount: expencesState.userExpences.length,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
