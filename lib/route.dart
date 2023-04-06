import 'package:flutter/material.dart';

import 'features/user/presentation/views/user_view.dart';

const String userView = '/';

Route<dynamic> controller(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case userView:
      builder = (BuildContext context) => const UserView();
      break;
    default:
      throw ('Route does not exist');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
