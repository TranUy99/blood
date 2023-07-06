import '../../../constant/widget/validate.dart';
import '../service/service.dart';
import 'log_in_state.dart';

OnLogInState onLogInState = OnLogInState(false);

class LogInBloc {
  LoginService loginService = LoginService();



  Future<void> checkLogin(String email, String password) async {

    await LoginService.loginService(email, password).then((value) {
      if (Validate.checkInvalidateNewPassword(password) == false &&
          Validate.invalidateEmail(email) == false &&
          value.message == null) {
        onLogInState = OnLogInState(true);
      }else{
        onLogInState = OnLogInState(false);
      }
    });
  }


}

