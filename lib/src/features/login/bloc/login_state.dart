import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginState {}

class InitialState extends LoginState {
}

class SuccessLoginState extends LoginState {
  bool onLoginState = false;
  bool isVerified = false;
  SuccessLoginState(this.onLoginState, this.isVerified);

  void saveLoginState(String? email, String? password, String? token, int? id, bool isRemember) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', email!);
    preferences.setString('token', token!);
    preferences.setInt('id', id!);
    if(isRemember && isVerified){
      preferences.setString('password', password!);
    }else{
      preferences.remove('password');
    }
  }
}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState(this.errorMessage);
}

