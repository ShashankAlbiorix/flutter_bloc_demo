import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/dashboard/dashboard.dart';
import 'package:flutter_bloc_demo/home/home_screen.dart';

import '../SplashScreen/splash_screen.dart';

class AppRouter {
  static Route onGanerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SpleshScreen.routeName:
        return SpleshScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case DashboardScreen.routeName:
        return DashboardScreen.route();
      default:
        return _errorWidget();
    }
  }

  static Route _errorWidget() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (BuildContext context) => const SpleshScreen());
  }
}
