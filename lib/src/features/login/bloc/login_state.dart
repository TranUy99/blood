import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginState {}

class InitialState extends LoginState {}

//Success state login
class SuccessLoginState extends LoginState {
  bool onLoginState = false;
  bool isVerified = false;

  SuccessLoginState(this.onLoginState, this.isVerified);

  //Save data login in shared preferences
  void saveLoginState(String? email, String? password, String? token, int? id,
      bool isRemember) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', email!);
    preferences.setString('token', token!);
    preferences.setInt('idUser', id!);
    if (isRemember) {
      preferences.setString('password', password!);
    } else {
      preferences.remove('password');
    }
  }
}

//Failed state login
class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState(this.errorMessage);
}
