import 'package:shared_preferences/shared_preferences.dart';

class OnLogInState {
  final bool onLogin;
  OnLogInState(this.onLogin);
}

class SaveLoginState {
  static void saveLoginInformation(String? email, int? id, String? token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', email!);
    preferences.setInt('id', id!);
    preferences.setString('token', token!);
  }
}
