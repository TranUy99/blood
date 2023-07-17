import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:mobile_store/src/features/login/bloc/login_event.dart';

import '../bloc/login_state.dart';

class LoginViewModel {
  final _loginBloc = LoginBloc();
  RxLoginBloc _rxLoginBloc = RxLoginBloc();

  Future<bool> login(String email, String password) async {
    // final loginEvent = LoginEvent(email, password);
    // // print("view model ${email}");
    // _loginBloc.addEvent(loginEvent);
    // await _loginBloc.addEvent(LoginEvent(email, password));
    await _rxLoginBloc.handleEvent(LoginEvent(email, password));
    bool isLogin = false;

    await _rxLoginBloc.state.listen(
      (state) {
        if (state is SuccessLoginState) {
          print('Login viewmodel: ${state.onLoginState}');
          isLogin = true;
        } else if (state is ErrorLoginState) {
          print('Login viewmodel: ${state.errorMessage}');
          isLogin = false;
        }
      },
    );

    return isLogin;
  }

  void dispose() {
    _rxLoginBloc.dispose();
  }
}
