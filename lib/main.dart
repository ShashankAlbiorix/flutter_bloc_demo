import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/SplashScreen/splash_screen.dart';
import 'SplashScreen/bloc/splash_screen_bloc.dart';
import 'app_config/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenBloc(),
      child: const MaterialApp(
        onGenerateRoute: AppRouter.onGanerateRoute,
        initialRoute: SpleshScreen.routeName,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
