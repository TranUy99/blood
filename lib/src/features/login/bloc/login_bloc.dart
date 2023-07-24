import 'dart:async';

import 'package:mobile_store/src/features/login/bloc/login_event.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/login_service.dart';
import 'login_state.dart';

SuccessLoginState successLoginState = SuccessLoginState(false);

class LoginBloc{
  // final _loginStateController = StreamController<LoginState>.broadcast();
  //
  // Stream<LoginState> get loginStream => _loginStateController.stream;

  final StreamController<LoginState> _loginStreamController = StreamController<LoginState>();
  Stream<LoginState> get loginStream => _loginStreamController.stream;

  Future<void> addEvent(LoginEvent event) async {
    final email = event.email;
    final password = event.password;
    String? mess;
    String? token;
    int? id;
  
    final loginResult = LoginService.loginService(email, password);
    try{
      await loginResult.then((value) {
        mess = value.message;
        token = value.token;
        id = value.idUser;
        // print(value.message);
      });
    }catch(e){
      mess = 'failed to get data';
    }
    print( 'message in bloc: $mess');

    if(mess == null){
      // _loginStreamController.add(SuccessLoginState(true));
      // SuccessLoginState.saveLoginState(email, password, token, id);
    }else{
      // _loginStreamController.add(ErrorLoginState(mess!));
    }
  }

  void dispose() {
    _loginStreamController.close();
  }
}

class RxLoginBloc {
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
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print('bloc: ${preferences.getString('token')}');
  }

  void dispose() {
    _stateController.close();
  }
}