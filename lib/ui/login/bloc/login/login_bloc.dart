import 'dart:async';

import 'package:mobile_store/ui/login/validators/validations.dart';

class LoginBloc {
  StreamController _phonenumberController = new StreamController();
  StreamController _passController = new StreamController();

  bool isValidInfo (String phonenumber, String pass) {
    if (!Validations.isValiPhonenumber(phonenumber)) {
      _phonenumberController.sink.addError("Số điện thoại không hợp lệ");
      return false;
    }
     if (!Validations.isValiPass(pass)) {
      _passController.sink.addError("Mật khẩu không hợp lệ");
      return false;
    }
    return true;
  }
}