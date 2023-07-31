import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_config/routerName.dart';
import '../constant.dart';
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
      backgroundColor: blueColor,
      body: _splashBody(context),
    );
  }

  _splashBody(BuildContext context) {
    return BlocListener<SplashScreenBloc, SplashScreenState>(
      listener: (context, state) {
        if (state is SplashScreenLoaded) {
          Future.delayed(const Duration(seconds: 5), () {
            Navigator.pushNamed(context, signinRoute);
          });
        }
      },
      child: Container(
        child: Center(
          child: Image.asset('assets/png/single icon White.png'),
        ),
      ),
    );
  }
}
