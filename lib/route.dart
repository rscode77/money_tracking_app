import 'package:flutter/material.dart';
import 'package:money_tracking_app/features/balance/presentation/views/all_expences_view.dart';
import 'package:money_tracking_app/features/balance/presentation/views/balance_view.dart';
import 'package:money_tracking_app/features/balance/presentation/views/new_card.dart';
import 'package:money_tracking_app/features/balance/presentation/views/new_expence.dart';
import 'package:money_tracking_app/features/launch/presentation/views/launch_view.dart';

const String userView = '/';
const String balanceView = '/balance';
const String newCard = '/newCard';
const String newExpence = '/newExpence';
const String allExpences = '/allExpences';

Route<dynamic> controller(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case userView:
      builder = (BuildContext context) => const LaunchView();
      break;
    case balanceView:
      builder = (BuildContext context) => const BalanceView();
      break;
    case newCard:
      builder = (BuildContext context) => const NewCardView();
      break;
    case newExpence:
      builder = (BuildContext context) => const NewExpenceView();
      break;
    case allExpences:
      builder = (BuildContext context) => const AllExpencesView();
      break;
    default:
      throw ('Route does not exist');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
