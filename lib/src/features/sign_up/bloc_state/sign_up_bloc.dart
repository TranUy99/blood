import 'dart:async';
import 'dart:developer';

import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_event.dart';
import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_state.dart';
import 'package:mobile_store/src/features/sign_up/service/servie.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc {
  final BehaviorSubject<SignUpState> _signUpStateSubject = BehaviorSubject<SignUpState>();

  Stream<SignUpState> get signUpStateStream => _signUpStateSubject.stream;

  void addEvent(SignUpEvent event) async {
    final email = event.email;
    final password = event.password;
    final fullName = event.fullName;
    final signUpResult = await SignUpService.signUpService(email, password, fullName);

    if (signUpResult.message == null) {
      _signUpStateSubject.add(SignUpSuccessState());
      log('Current state1: ${SignUpSuccessState().toString()}');
    } else {
      _signUpStateSubject.add(SignUpFailureState(signUpResult.message!));
      log('Current state2: ${SignUpFailureState(signUpResult.message!).toString()}');
    }
  }

  void dispose() {
    _signUpStateSubject.close();
  }
}