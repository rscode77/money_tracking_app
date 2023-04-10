import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:money_tracking_app/constants/app_constants.dart';
import 'package:money_tracking_app/features/balance/blocs/expences/expences_bloc.dart';
import 'package:money_tracking_app/features/balance/domain/entities/user_expence.dart';
import 'package:money_tracking_app/features/balance/presentation/widgets/balance_custom_button_widget.dart';
import 'package:money_tracking_app/features/balance/presentation/widgets/expence_category_widget.dart';
import 'package:money_tracking_app/features/launch/blocs/launch/launch_bloc.dart';

import '../widgets/custom_text_field_widget.dart';

class NewExpenceView extends StatelessWidget {
  const NewExpenceView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController expenceValue = TextEditingController();
    TextEditingController category = TextEditingController();

    return Scaffold(
      backgroundColor: mainBlue,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 30.h,
                    ),
                    child: InkWell(
                      onTap: () => {Navigator.pop(context)},
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        ),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Gap(30.h),
                            const Text(
                              'New Expence',
                              style: TextStyle(
                                fontFamily: 'DarkGrotesque',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(30.h),
                            CustomTextField(
                              title: 'Expense value',
                              hint: '\$',
                              textEditingController: expenceValue,
                              textInputType: TextInputType.number,
                            ),
                            Gap(20.h),
                            ExpenceCategoryWidget(controller: category),
                            Gap(30.h),
                            BalanceCustomButtonWidget(
                              text: 'Confirm new expence',
                              onPressed: () => {
                                context.read<ExpencesBloc>().add(
                                      InsertUserExpenceEvent(
                                        database: context.read<LaunchBloc>().state.database!,
                                        userExpence: UserExpence(
                                          id: null,
                                          category: category.text,
                                          time: 'Added ${DateFormat.yMMMd().format(DateTime.now())}',
                                          value: double.parse(expenceValue.text),
                                        ),
                                      ),
                                    ),
                                Navigator.pop(context),
                              },
                              color: black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
