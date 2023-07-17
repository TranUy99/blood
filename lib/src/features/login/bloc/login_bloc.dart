import 'dart:async';
import 'dart:developer';
import 'package:mobile_store/src/features/login/bloc/login_event.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/service.dart';
import 'login_state.dart';

SuccessLoginState successLoginState = SuccessLoginState(false);

String? nameUser;

class LoginBloc {
  final _stateController = BehaviorSubject<LoginState>();
  String? mess;
  int? id;
  String? token;
  Stream<LoginState> get state => _stateController.stream;


  Future <void> handleEvent(LoginEvent event) async {
    await _login(event.email, event.password);
  }

  Future <void> _login(String email, String password) async {
    final loginResult = LoginService.loginService(email, password);
    try{
      await loginResult.then((value) {
        mess = value.message;
        id = value.idUser;
        token = value.token;
        // print('$id - $token');
      });
    }catch(e){
      mess = 'failed to get data';
    }
    print('bloc mess: ${mess}');

    if (mess == null) {
      _stateController.add(successLoginState = SuccessLoginState(true));
      successLoginState.saveLoginState(email, password, token, id);
      print('bloc susscess');
    } else {
      _stateController.add(ErrorLoginState(mess!));
      print('bloc fail');
    }

    final userResult = UserService.userService(id!, token!);
    await userResult.then((value) {
      nameUser = value.fullName;
    });
  }

  void dispose() {
    _stateController.close();
  }
}