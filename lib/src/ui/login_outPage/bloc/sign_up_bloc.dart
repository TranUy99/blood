import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../event/sign_up_event.dart';
import '../state/sign_up_state.dart';

class SignUpBloc{
  var state = SignUpState([]);
  final eventSignUpController = StreamController<SignUpEvent>();
  final stateController = StreamController<SignUpState>();
  SignUpBloc(){
    eventSignUpController.stream.listen((event) {
      state = SignUpState(event.saveInformation);
      stateController.sink.add(state);
    });
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
