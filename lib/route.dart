import 'package:flutter/material.dart';
import 'package:money_tracking_app/features/balance/presentation/views/balance_view.dart';

const String userView = '/';

Route<dynamic> controller(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case userView:
      builder = (BuildContext context) => const BallanceView();
      break;
    default:
      throw ('Route does not exist');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
