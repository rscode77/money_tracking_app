import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracking_app/features/user/blocs/bloc/user_bloc.dart';

import 'route.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 781),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => UserBloc(),
            ),
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