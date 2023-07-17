import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginState {}

class InitialState extends LoginState {
}

class SuccessLoginState extends LoginState {
  bool onLoginState = false;
  SuccessLoginState(this.onLoginState);

  void saveLoginState(String? email, String? password, String? token, int? id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', email!);
    preferences.setString('password', password!);
    preferences.setString('token', token!);
    preferences.setInt('id', id!);
  }
}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState(this.errorMessage);
}

