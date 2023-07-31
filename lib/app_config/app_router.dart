import 'package:bigbaazar/app_config/routerName.dart';
import 'package:flutter/material.dart';

import '../SplashScreen/splash_screen.dart';
import '../dashboard/dashboard.dart';
import '../signin/signin.dart';
import '../signup/signup_screen.dart';

class AppRouter {
  static Route onGanerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SpleshScreen.routeName:
        return SpleshScreen.route();
      case signinRoute:
        return SigninScreen.route();
      case dashboardRoute:
        return DashboardScreen.route();
      case signUpRoute:
        return SignupScreen.route();
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
