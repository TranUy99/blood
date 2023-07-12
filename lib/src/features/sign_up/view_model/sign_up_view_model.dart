import 'dart:developer';

import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_bloc.dart';
import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_event.dart';

class SignUpViewModel {
  final _signUpBloc = SignUpBloc();

  void signUp(
    String email,
    String password,
    String fullName,
  
  ) {
    final signUpEvent = SignUpEvent(email, password, fullName);
  

    _signUpBloc.addEvent(signUpEvent);
  }

  void dispose() {}
}
