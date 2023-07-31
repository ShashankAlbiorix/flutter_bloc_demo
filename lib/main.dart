import 'package:bigbaazar/SplashScreen/splash_screen.dart';
import 'package:bigbaazar/signin/bloc/signin_bloc.dart';
import 'package:bigbaazar/signup/bloc/signup_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'SplashScreen/bloc/splash_screen_bloc.dart';
import 'app_config/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashScreenBloc>(create: (context) => SplashScreenBloc()),
        BlocProvider<SigninBloc>(create: (context) => SigninBloc()),
        BlocProvider<SignupBloc>(create: (context) => SignupBloc()),
      ],
      child: MaterialApp(
        themeAnimationCurve: Curves.bounceIn,
        theme: ThemeData(useMaterial3: true),
        onGenerateRoute: AppRouter.onGanerateRoute,
        initialRoute: SpleshScreen.routeName,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
