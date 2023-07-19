import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = 'dashboard';
  const DashboardScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const DashboardScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
