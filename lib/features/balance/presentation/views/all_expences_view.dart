import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracking_app/constants/app_constants.dart';
import 'package:money_tracking_app/features/balance/presentation/widgets/balance_custom_button_widget.dart';

import '../../blocs/expences/expences_bloc.dart';
import '../widgets/expences_widget.dart';

class AllExpencesView extends StatefulWidget {
  const AllExpencesView({super.key});

  @override
  State<AllExpencesView> createState() => _AllExpencesViewState();
}

class _AllExpencesViewState extends State<AllExpencesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
          child: Column(
            children: [
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
              const Spacer(),
              BalanceCustomButtonWidget(
                text: 'Back',
                onPressed: () => Navigator.pop(context),
                color: black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
