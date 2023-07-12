import 'dart:async';
import 'package:mobile_store/src/features/login/bloc/login_event.dart';
import '../service/service.dart';
import 'login_state.dart';

OnLogInState onLogInState = OnLogInState(false);

class LoginBloc {
  final _loginStateController = StreamController<LoginState>.broadcast();

  Stream<LoginState> get loginStateStream => _loginStateController.stream;

  void addEvent(LoginEvent event) {
    final email = event.email;
    final password = event.password;
    // log("bloc $email");
    final loginResult = LoginService.loginService(email, password);

    if (loginResult == true) {
      _loginStateController.add(LoginSuccessState());
    } else {
      _loginStateController.add(LoginFailureState("error"));
    }
  }

  void dispose() {
    _loginStateController.close();
  }
}
