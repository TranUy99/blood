import 'dart:async';

import 'package:flutter/cupertino.dart';

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

class OnChangePasswordBloc{
  var state = OnChangePasswordState('');
  final eventOnChangePasswordController = StreamController<OnChangePasswordEvent>();
  final stateOnChangePasswordController = StreamController<OnChangePasswordState>();
  OnChangePasswordBloc(){
    eventOnChangePasswordController.stream.listen((event) {
      state = OnChangePasswordState(event.onChangePasswordEvent);
      stateOnChangePasswordController.sink.add(state);
    });
  }
}

class SharedTextPasswordBloc extends ChangeNotifier {
  String _sharedText = '';
  String get sharedText => _sharedText;

  set sharedText(String value) {
    _sharedText = value;
    notifyListeners();
  }
}
