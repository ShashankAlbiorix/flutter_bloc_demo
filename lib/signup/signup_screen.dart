import 'package:bigbaazar/signup/bloc/signup_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_config/routerName.dart';
import '../constant.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfeild.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: signUpRoute),
        builder: (_) => SignupScreen());
  }

  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                ),
                Image.asset('assets/png/Icon.png'),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                ),
                const Text(
                  "Let’s Get Started",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  "Create an new account",
                  style: TextStyle(
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
                  textEditingController: nameTextController,
                  hint: "Full Name",
                  prefixIcon: const Icon(
                    Icons.account_circle_outlined,
                    color: grayColor,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                ),
                CommonTextfield(
                  textEditingController: emailTextController,
                  hint: "Email",
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
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: grayColor,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                ),
                CommonTextfield(
                  textEditingController: passwordTextController,
                  hint: "Conform Password",
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: grayColor,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<SignupBloc>(context).add(
                      EmailSignupEvent("Shashank@gmail.com", "Saslo#0165"),
                    );
                  },
                  child: state is SignupInitial
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: CommonButton(btnName: "Sign Up"),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                        child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: 'have a account? ',
                          style: TextStyle(color: grayColor, fontSize: 12),
                        ),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, signinRoute);
                              },
                            text: ' Sign in',
                            style: const TextStyle(
                                color: blueColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold))
                      ]),
                    )))
              ],
            ),
          )),
        );
      },
    );
  }
}
