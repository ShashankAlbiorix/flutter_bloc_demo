part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object> get props => [];
}

// When the user signing in with google this event is called and the [AuthRepository] is called to sign in the user
class GoogleSignInRequested extends SigninEvent {}

class EmailSignInRequested extends SigninEvent {
  String emailID;
  String password;

  EmailSignInRequested(this.emailID, this.password);
}
