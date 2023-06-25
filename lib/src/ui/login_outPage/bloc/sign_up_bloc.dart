import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../event/sign_up_event.dart';
import '../state/sign_up_state.dart';

class SignUpBloc {
  late List<String> _registerList;
  void updateInformation(List<String> registerList) {
    _registerList = registerList;
  }

  void signUp() {
    // Perform registration logic here
    // You can use the _email and _password variables to submit the registration data
    print(_registerList.join(', '));
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


