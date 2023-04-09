import 'package:flutter/material.dart';
import 'package:money_tracking_app/features/balance/presentation/views/balance_view.dart';
import 'package:money_tracking_app/features/user/presentation/views/user_view.dart';

const String userView = '/';
const String balanceView = '/balance';

Route<dynamic> controller(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case userView:
      builder = (BuildContext context) => const UserView();
      break;
    case balanceView:
      builder = (BuildContext context) => const BalanceView();
      break;
    default:
      throw ('Route does not exist');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
