import 'dart:async';
import 'dart:developer';

import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_event.dart';
import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_state.dart';
import 'package:mobile_store/src/features/sign_up/service/servie.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc {
  final BehaviorSubject<SignUpState> _signUpStateSubject = BehaviorSubject<SignUpState>();

  Stream<SignUpState> get signUpStateStream => _signUpStateSubject.stream.distinct();
  bool isSignUpButtonPressed = false;
  bool _isProcessing = false;
  Future<void> addEvent(SignUpEvent event) async {
    if (_isProcessing) return;

    _isProcessing = true;
    if (event is SignUpButtonPressedEvent) {
      isSignUpButtonPressed = true;
      final email = event.email;
      final password = event.password;
      final fullName = event.fullName;

      try {
        final signUpResult = await SignUpService.signUpService(email, password, fullName);

        if (signUpResult.message == null) {
          _signUpStateSubject.sink.add(SuccessSignUpState(true));
          log("success");
        } else {
          _signUpStateSubject.sink.add(ErrorSignUpState("error"));
          log("failure");
        }
      } catch (e) {
        _signUpStateSubject.add(ErrorSignUpState("error"));
      }
    }
    _isProcessing = false;
  }

  void dispose() {
    _signUpStateSubject.close();
  }
}
