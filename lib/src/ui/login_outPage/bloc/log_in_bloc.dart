import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../event/log_in_event.dart';
import '../state/log_in_state.dart';

// class LogInBloc {
//   var state = LogInState([]);
//   final eventLogInController = StreamController<LogInRemoteEvent>();
//   final stateController = StreamController<LogInState>();
//   LogInBloc() {
//     eventLogInController.stream.listen((event) {
//       if (event is LogInEvent) {
//         state = LogInState(event.saveInformation);
//       }
//       stateController.sink.add(state);
//     });
//   }
// }

class LogInBloc {
  late String _phoneNumber;
  late String _password;
  void updateInformation(String phoneNumber, String password) {
    _phoneNumber = phoneNumber;
    _password = password;
  }

  void logIn() {
    print('Keep: $_phoneNumber - $_password');
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
