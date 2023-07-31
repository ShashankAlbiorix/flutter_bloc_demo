import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../helper/firebase_helper.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninEvent>((event, emit) {});

    on<GoogleSignInRequested>((event, emit) async {
      emit(SigninLoading());
      String val = await handleGoogleSignIn();
      if (val == "Susccess") {
        emit(SigninLoaded());
      } else {
        emit(SigninInitial());
      }
    });

    on<EmailSignInRequested>((event, emit) async {
      emit(SigninLoading());
      String val = await handleEmailSignIn(event.emailID, event.password);
      if (val == "Susccess") {
        emit(SigninLoaded());
      } else {
        emit(SigninInitial());
      }
    });
  }
}
