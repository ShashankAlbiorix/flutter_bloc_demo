import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_config/routerName.dart';
import '../constant.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfeild.dart';
import 'bloc/signin_bloc.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: signinRoute),
        builder: (_) => SigninScreen());
  }

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    emailTextController.text = "Shashank@gmail.com";
    passwordTextController.text = "Saslo#0165";
    return BlocConsumer<SigninBloc, SigninState>(
      listener: (context, state) {
        if (state is SigninLoaded) {
          Navigator.pushNamed(context, dashboardRoute);
        }
      },
      builder: (context, state) {
        if (state is SigninLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is SigninInitial) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                    ),
                    Image.asset('assets/png/Icon.png'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 10,
                    ),
                    const Text(
                      "Welcome to Big Bazaar",
                      style: TextStyle(
                        fontFamily: poppins,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      "Sign in to continue",
                      style: TextStyle(
                        fontFamily: poppins,
                        fontWeight: FontWeight.w700,
                        color: grayColor,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                    ),
                    CommonTextfield(
                      textEditingController: emailTextController,
                      hint: "Your Email",
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: grayColor,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 10,
                    ),
                    CommonTextfield(
                      textEditingController: passwordTextController,
                      hint: "Password",
                      isSuffix: true,
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: grayColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: state is SigninLoaded || state is SigninInitial
                          ? CommonButton(
                              btnName: "Sign in",
                              onTap: () {
                                BlocProvider.of<SigninBloc>(context).add(
                                  EmailSignInRequested(emailTextController.text,
                                      passwordTextController.text),
                                );
                              })
                          : const Center(
                              child: CircularProgressIndicator(
                                color: blueColor,
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: grayColor,
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                fontFamily: poppins,
                                fontWeight: FontWeight.w700,
                                color: grayColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: grayColor,
                              height: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<SigninBloc>(context).add(
                          GoogleSignInRequested(),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: grayColor)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/png/Google.png'),
                            ),
                            const Expanded(
                                child: Center(
                              child: Text(
                                "Login with Google",
                                style: TextStyle(
                                  fontFamily: poppins,
                                  fontWeight: FontWeight.w700,
                                  color: grayColor,
                                  fontSize: 14,
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: grayColor)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/png/Facebook.png'),
                          ),
                          const Expanded(
                              child: Center(
                            child: Text(
                              "Login with Facebook",
                              style: TextStyle(
                                fontFamily: poppins,
                                fontWeight: FontWeight.w700,
                                color: grayColor,
                                fontSize: 14,
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontFamily: poppins,
                          fontWeight: FontWeight.bold,
                          color: blueColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                            child: RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                              text: ' Don\'t have an account?',
                              style: TextStyle(
                                  fontFamily: poppins,
                                  color: grayColor,
                                  fontSize: 12),
                            ),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, signUpRoute);
                                  },
                                text: ' Sign up',
                                style: const TextStyle(
                                    fontFamily: poppins,
                                    color: blueColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))
                          ]),
                        )))
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
