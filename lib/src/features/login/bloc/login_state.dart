import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginState {}

class InitialState extends LoginState {
  // Trạng thái khởi tạo
}

class SuccessLoginState extends LoginState {
  final bool onLoginState;
  SuccessLoginState(this.onLoginState);

  static void saveLoginState(String? email, String? password, String? token, int? id) async {
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

class LoginStatusState extends LoginState {
  bool onLoginState = false;
  LoginStatusState(this.onLoginState);

  // Trạng thái đăng nhập thành công
  void saveLoginState(String? email, String? password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', email!);
    preferences.setString('password', password!);
  }
}



// class LoginState {
//   static void saveLoginInformation(String? email, int? id, String? token) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setString('email', email!);
//     preferences.setInt('id', id!);
//     preferences.setString('token', token!);
//   }
//}