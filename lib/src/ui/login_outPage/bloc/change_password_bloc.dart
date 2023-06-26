import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../event/log_in_event.dart';
import '../state/log_in_state.dart';

class ChangePasswordBloc {
  late String _oldPassword;
  late String _newPassword;
  void updatePassword(String oldPassword, String newPassword) {
    _oldPassword = oldPassword;
    _newPassword = newPassword;
  }

  void changePassword() {
    print('Keep: $_oldPassword - $_newPassword');
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
