import 'dart:async';

import 'package:mobile_store/src/features/register/bloc_state/sign_up_event.dart';
import 'package:mobile_store/src/features/register/bloc_state/sign_up_state.dart';
import 'package:mobile_store/src/features/register/service/servie.dart';

class SignUpBloc {

   final _loginStateController = StreamController<SignUpState>.broadcast();

  Stream<SignUpState> get loginStateStream => _loginStateController.stream;

  void addEvent(SignUpEvent event) {
    final email = event.email;
    final password = event.password;
    // log("bloc $email");
    // final loginResult = SignUpService.signUpService(email, password);

    // if (loginResult == true) {
    //   _loginStateController.add(LoginSuccessState());
    // } else {
    //   _loginStateController.add(LoginFailureState("error"));
    // }
  }

  void dispose() {
    _loginStateController.close();
  }
}


