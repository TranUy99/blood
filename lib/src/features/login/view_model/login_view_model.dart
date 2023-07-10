import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:mobile_store/src/features/login/bloc/login_event.dart';

class LoginViewModel {
  final _loginBloc = LoginBloc();

  void login(String email, String password) {
    final loginEvent = LoginEvent(email, password);
    // log("view model ${email}");
    _loginBloc.addEvent(loginEvent);
  }

  void dispose() {}
}
