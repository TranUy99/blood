import 'package:shared_preferences/shared_preferences.dart';

import '../service/service.dart';
import 'log_in_state.dart';

OnLogInState onLogInState = OnLogInState(false);

class LogInBloc {
  List<String?>? information ;
  LoginService loginService = LoginService();

  void login(String email, String password) async {
    information = await loginService.loginService(email, password);
    SaveLoginState.saveLoginInformation(
        information?[0], int.parse(information![1]!), information?[2]);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print('${preferences.getString('email')} - ${preferences.getInt('id')} - ${preferences.getString('token')}');
  }

}

