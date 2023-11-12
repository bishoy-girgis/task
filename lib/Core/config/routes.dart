import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/Core/config/page_route_name.dart';

import '../../Home/pages/home_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case PageRouteName.home:
        return MaterialPageRoute<dynamic>(
            builder: (context) =>  HomeView(), settings: routeSettings);
      default:
        return MaterialPageRoute<dynamic>(
            builder: (context) =>  HomeView(), settings: routeSettings);
    }
  }
}
