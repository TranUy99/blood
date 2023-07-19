import 'dart:async';
import 'dart:developer';
import 'package:mobile_store/src/features/login/bloc/login_event.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/login_service.dart';
import 'login_state.dart';

SuccessLoginState successLoginState = SuccessLoginState(false, false);

String? nameUser;

class LoginBloc {
  final _stateController = BehaviorSubject<LoginState>();
  String? mess;
  int? id;
  String? token;
  bool verifiedStatus = false;
  Stream<LoginState> get state => _stateController.stream;


  Future <void> handleEvent(LoginEvent event) async {
    await _login(event.email, event.password, event.isRemember);
  }

  Future <void> _login(String email, String password, bool isRemember) async {
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

    final userResult = UserService.userService(id!, token!);
    await userResult.then((value) {
      nameUser = value.fullName;
      verifiedStatus = value.statusDTO!;
    });

    if (mess == null) {
      if(verifiedStatus){
        _stateController.add(successLoginState = SuccessLoginState(true, true));
      }else{
        _stateController.add(successLoginState = SuccessLoginState(true, false));
      }

      successLoginState.saveLoginState(email, password, token, id, isRemember);
    } else {
      _stateController.add(ErrorLoginState(mess!));
    }


  }

  void dispose() {
    _stateController.close();
  }
}