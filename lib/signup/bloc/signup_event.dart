part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class EmailSignupEvent extends SignupEvent {
  String emailID;
  String password;

  EmailSignupEvent(this.emailID, this.password);
}
