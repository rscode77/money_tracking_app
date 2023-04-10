import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:money_tracking_app/features/launch/presentation/widgets/text_carousel.dart';
import 'package:money_tracking_app/route.dart';

import '../../blocs/launch/launch_bloc.dart';
import '../widgets/launcher_custom_button.dart';

class LaunchView extends StatelessWidget {
  const LaunchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/background.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<LaunchBloc, LaunchState>(
          builder: (context, state) {
            return state.database == null
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const TextCarousel(),
                      Gap(30.h),
                      LauncherCustomButton(
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          balanceView,
                          (route) => false,
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
