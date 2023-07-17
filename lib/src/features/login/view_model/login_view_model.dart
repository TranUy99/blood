import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:mobile_store/src/features/login/bloc/login_event.dart';

import '../bloc/login_state.dart';

class LoginViewModel {
  final LoginBloc _loginBloc = LoginBloc();

  Future <bool> login(String email, String password) async {
    await _loginBloc.handleEvent(LoginEvent(email, password));
    bool isLogin = false;

    await _loginBloc.state.listen((state) {
      if (state is SuccessLoginState) {
        print('Login viewmodel: ${state.onLoginState}');
        isLogin = true;
      } else if (state is ErrorLoginState) {
        print('Login viewmodel: ${state.errorMessage}');
        isLogin = false;
      }
    },);

    return isLogin;
  }

  void dispose() {
    _loginBloc.dispose();
  }
}
