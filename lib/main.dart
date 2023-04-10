import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/balance/blocs/card/card_bloc.dart';
import 'features/balance/blocs/expences/expences_bloc.dart';
import 'features/launch/blocs/launch/launch_bloc.dart';
import 'route.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 781.0909090909091),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => LaunchBloc()..add(InitDatabse()),
            ),
            BlocProvider(create: (BuildContext context) => ExpencesBloc()),
            BlocProvider(create: (BuildContext context) => CardBloc()),
          ],
          child: MaterialApp(
            title: 'MoneyTrackingApp',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: route.userView,
            onGenerateRoute: route.controller,
          ),
        );
      },
    );
  }
}
