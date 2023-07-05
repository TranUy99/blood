
import 'log_in_bloc.dart';

class LogInEvent {

  static  checkLoginEvent(String email, String password) async {
    LogInBloc logInBloc = LogInBloc();
    logInBloc.checkLogin(email, password);
  }
}
