import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../state/log_in_state.dart';

LogInState logInState = LogInState('', '');
OnLogInState onLogInState = OnLogInState(false);

class LogInBloc {
  void updateInformation(String phoneNumber, String password) {
    logInState = LogInState(phoneNumber, password);
  }
  void logIn() {
    print('keep state ${logInState.phoneNumber} - ${logInState.password}');
    if(logInState.phoneNumber != '' && logInState.password != ''){
      onLogInState = OnLogInState(true);
    }
    print(onLogInState.onLogin);
  }
  bool checkLogin(){
    return onLogInState.onLogin;
  }
}

class SharedTextPasswordBloc extends ChangeNotifier {
  final _textFieldController = BehaviorSubject<String>();
  Stream<String> get textFieldStream => _textFieldController.stream;
  void updateTextField(String value) {
    _textFieldController.add(value);
  }
  void dispose() {
    _textFieldController.close();
  }
}

