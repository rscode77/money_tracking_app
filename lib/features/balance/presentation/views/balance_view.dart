import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:money_tracking_app/constants/app_constants.dart';
import 'package:money_tracking_app/features/launch/blocs/launch/launch_bloc.dart';

import '../../blocs/card/card_bloc.dart';
import '../../blocs/expences/expences_bloc.dart';
import '../widgets/current_balance_widget.dart';
import '../widgets/expences_widget.dart';
import '../widgets/expenses_header_widget.dart';
import '../widgets/incoming_spent_widget.dart';
import '../widgets/naw_drawer_widget.dart';
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
  void initState() {
    var db = context.read<LaunchBloc>().state.database!;
    context.read<CardBloc>().add(GetCardsEvent(database: db));
    context.read<ExpencesBloc>().add(GetExpencesEvent(database: db));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawerWidget(),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: BlocBuilder<LaunchBloc, LaunchState>(
          builder: (context, userState) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserHeaderWidget(
                    menuPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                  Gap(20.h),
                  const CurrentBalanceWidget(),
                  Gap(20.h),
                  const IncomingSpentWidget(),
                  Gap(20.h),
                  const YourCardsHeaderWidget(),
                  Gap(8.h),
                  BlocBuilder<CardBloc, CardState>(
                    builder: (context, cardsState) {
                      return cardsState.userCards.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Add card from side menu',
                                style: TextStyle(
                                  fontFamily: 'DarkGrotesque',
                                  height: 1.h,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var card = cardsState.userCards[index];
                                return YourCardsWidget(
                                  id: card.id!,
                                  lastFourDigit: card.lastFourDigits,
                                  name: card.name,
                                  value: card.value,
                                );
                              },
                              itemCount: cardsState.userCards.length,
                            );
                    },
                  ),
                  Gap(10.h),
                  const ExpencesHeaderWidget(),
                  Gap(5.h),
                  BlocBuilder<ExpencesBloc, ExpencesState>(
                    builder: (context, expencesState) {
                      return expencesState.userExpences.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Add expences from side menu',
                                style: TextStyle(
                                  fontFamily: 'DarkGrotesque',
                                  height: 1.h,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var expence = expencesState.userExpences[index];
                                return ExpencesWidget(
                                  category: expence.category,
                                  id: expence.id!,
                                  time: expence.time,
                                  value: expence.value,
                                );
                              },
                              itemCount: expencesState.userExpences.length,
                            );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
