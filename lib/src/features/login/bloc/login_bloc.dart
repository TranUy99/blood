import 'dart:async';
import 'dart:developer';
import 'package:mobile_store/src/constant/utils/validate.dart';
import 'package:mobile_store/src/features/login/bloc/login_event.dart';
import '../service/service.dart';
import 'login_state.dart';

OnLogInState onLogInState = OnLogInState(false);

class LoginBloc {
  final _loginStateController = StreamController<LoginState>.broadcast();

  Stream<LoginState> get loginStateStream => _loginStateController.stream;

  void addEvent(LoginEvent event) async {
    final email = event.email;
    final password = event.password;
    String? mess;
    // log("bloc $email");
    final loginResult = LoginService.loginService(email, password);

    try{
      await loginResult.then((value) {
        mess = value.message;
        // print(value.message);
      });
    }catch(e){
      mess = 'failed to get data';
    }
    print(mess);

    if (mess == null) {
      _loginStateController.add(LoginSuccessState());
      print('success');

    } else {
      _loginStateController.add(LoginFailureState("error"));
      print('fail');
    }
  }

  void dispose() {
    _loginStateController.close();
  }
}
