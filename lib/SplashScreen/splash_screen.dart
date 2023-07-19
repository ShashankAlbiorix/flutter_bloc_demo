import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/home/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bloc/splash_screen_bloc.dart';

class SpleshScreen extends StatefulWidget {
  static const routeName = 'splash';
  const SpleshScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SpleshScreen());
  }

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashScreenBloc>().add(SpleshScreenInitialEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _splashBody(context),
    );
  }

  _splashBody(BuildContext context) {
    return BlocListener<SplashScreenBloc, SplashScreenState>(
      listener: (context, state) {
        if (state is SplashScreenLoaded) {
          Future.delayed(const Duration(seconds: 5), () {
            Navigator.pushNamed(context, HomeScreen.routeName);
          });
        }
      },
      child: Container(
        child: Center(
          child: SvgPicture.asset('assets/svg/logo.svg'),
        ),
      ),
    );
  }
}
