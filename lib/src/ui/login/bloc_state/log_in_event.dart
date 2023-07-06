
import 'log_in_bloc.dart';

class LogInEvent {

  static Future<void>  checkLoginEvent(String email, String password) async {
    LogInBloc logInBloc = LogInBloc();
    await logInBloc.checkLogin(email, password);
  }
}
