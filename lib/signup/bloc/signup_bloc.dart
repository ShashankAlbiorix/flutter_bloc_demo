import 'package:bigbaazar/helper/firebase_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {});

    on<EmailSignupEvent>((event, emit) async {
      emit(SignupLoading());
      Future.delayed(const Duration(seconds: 10), () async {
        await handleSignUp(event.emailID, event.password);
        emit(SignupLoded());
      });
    });
  }
}
