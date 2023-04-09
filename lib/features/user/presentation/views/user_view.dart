import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracking_app/constants/app_constants.dart';
import 'package:money_tracking_app/route.dart';

import '../../blocs/user/user_bloc.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return state.database == null
                ? CircularProgressIndicator()
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
                    width: double.infinity,
                    height: 60.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(context, balanceView, (route) => false),
                      child: const Text(
                        'Add new user',
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
