import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../event/log_in_event.dart';
import '../state/log_in_state.dart';

class LogInBloc {
  late String _phonenumber;
  late String _password;

  void updateInformation(String phonenumber, String password) {
    _phonenumber = phonenumber;
    _password = password;
  }
  void logIn() {
    // Perform registration logic here
    // You can use the _email and _password variables to submit the registration data
    print('Phone number:$_phonenumber, Password: $_password');
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

