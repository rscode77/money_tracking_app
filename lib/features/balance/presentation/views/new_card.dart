import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:money_tracking_app/constants/app_constants.dart';
import 'package:money_tracking_app/features/balance/presentation/widgets/balance_custom_button_widget.dart';

import '../../../launch/blocs/launch/launch_bloc.dart';
import '../../blocs/card/card_bloc.dart';
import '../../domain/entities/user_card.dart';
import '../widgets/custom_text_field_widget.dart';

class NewCardView extends StatelessWidget {
  const NewCardView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController currentCardBalance = TextEditingController();
    TextEditingController lastFourDigit = TextEditingController();
    TextEditingController cardProvider = TextEditingController();

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
                              'New Card',
                              style: TextStyle(
                                fontFamily: 'DarkGrotesque',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(30.h),
                            CustomTextField(
                              title: 'Current card balance',
                              hint: '\$',
                              textEditingController: currentCardBalance,
                              textInputType: TextInputType.number,
                            ),
                            Gap(20.h),
                            CustomTextField(
                              title: 'Last four card digit',
                              hint: '1234',
                              textEditingController: lastFourDigit,
                              textInputType: TextInputType.number,
                            ),
                            Gap(20.h),
                            CustomTextField(
                              title: 'Card provider',
                              hint: 'Visa',
                              textEditingController: cardProvider,
                              textInputType: TextInputType.text,
                            ),
                            Gap(40.h),
                            BalanceCustomButtonWidget(
                              text: 'Confirm new card',
                              onPressed: () => {
                                context.read<CardBloc>().add(
                                      InsertCardEvent(
                                        database: context.read<LaunchBloc>().state.database!,
                                        userCard: UserCard(
                                            id: null,
                                            lastFourDigits: lastFourDigit.text,
                                            value: double.parse(currentCardBalance.text),
                                            name: cardProvider.text),
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
