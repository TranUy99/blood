import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

//import '../widget/validations.dart';
import '../event/log_in_event.dart';
import '../state/log_in_state.dart';

// class LoginBloc {
//   StreamController _phonenumberController = new StreamController();
//   StreamController _passController = new StreamController();

//   bool isValidInfo(String phonenumber, String pass) {
//     if (!Validations.isValidPhone(phonenumber)) {
//       _phonenumberController.sink.addError("Số điện thoại không hợp lệ");
//       return false;
//     }
//     if (!Validations.isValidPass(pass)) {
//       _passController.sink.addError("Mật khẩu trên 8 ký tự");
//       return false;
//     }
//     return true;
//   }
// }

class LogInBloc {
  var state = LogInState([]);
  final eventLogInController = StreamController<LogInRemoteEvent>();
  final stateController = StreamController<LogInState>();
  LogInBloc() {
    eventLogInController.stream.listen((event) {
      if (event is LogInEvent) {
        state = LogInState(event.saveInformation);
      }
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
