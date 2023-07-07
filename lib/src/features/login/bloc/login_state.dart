import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginState {}

class InitialState extends LoginState {
  // Trạng thái khởi tạo
}

class LoadingState extends LoginState {
  // Trạng thái đang xử lý đăng nhập
}

class LoginSuccessState extends LoginState {
  // Trạng thái đăng nhập thành công
}

class LoginFailureState extends LoginState {
  final String errorMessage;

  LoginFailureState(this.errorMessage);
  // Trạng thái đăng nhập thất bại, có thể kèm theo thông báo lỗi
}

class OnLogInState {
  final bool onLogin;
  OnLogInState(this.onLogin);
}

// class LoginState {
//   static void saveLoginInformation(String? email, int? id, String? token) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setString('email', email!);
//     preferences.setInt('id', id!);
//     preferences.setString('token', token!);
//   }
//}