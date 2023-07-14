import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:mobile_store/src/features/login/bloc/login_event.dart';

import '../bloc/login_state.dart';

class LoginViewModel {
  final _loginBloc = LoginBloc();
  RxLoginBloc _rxLoginBloc = RxLoginBloc();

  Future <void> login(String email, String password) async {
    // final loginEvent = LoginEvent(email, password);
    // // print("view model ${email}");
    // _loginBloc.addEvent(loginEvent);
    // await _loginBloc.addEvent(LoginEvent(email, password));
    final subscription = _rxLoginBloc.state.listen((state) {
      if (state is SuccessLoginState) {
        print('Login successful');
      } else if (state is ErrorLoginState) {
        print('Login failed: ${state.errorMessage}');
      }
    });

    _rxLoginBloc.handleEvent(LoginEvent(email, password));
  }

  void dispose() {}
}
