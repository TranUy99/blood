
import 'log_in_bloc.dart';

class LogInEvent {
  static void loginEvent(String email, String password){
    LogInBloc logInBloc = LogInBloc();
    logInBloc.login(email, password);
  }
}
