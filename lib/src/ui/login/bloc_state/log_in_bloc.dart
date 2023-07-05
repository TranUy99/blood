import '../../../constant/widget/validate.dart';
import '../service/service.dart';
import 'log_in_state.dart';

OnLogInState onLogInState = OnLogInState(false);

class LogInBloc {
  LoginService loginService = LoginService();



  void checkLogin(String email, String password) {
    String? message;
    LoginService.loginService(email, password).then((value) {
      if (Validate.checkInvalidateNewPassword(password) == false &&
          Validate.invalidateEmail(email) == false &&
          value.message == null) {
        message = value.message;
      } else {
        message = value.message;
      }
      // print(message);
    });
    print(message);
  }


}

