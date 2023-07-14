import 'dart:async';
import 'dart:developer';

import 'package:mobile_store/src/features/login/bloc/login_event.dart';
import 'package:rxdart/rxdart.dart';

import '../service/service.dart';
import 'login_state.dart';

LoginStatusState loginStatusState = LoginStatusState(false);

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
    log("bloc $email");
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
      SuccessLoginState.saveLoginState(email, password, token, id);
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

  // Outputs
  Stream<LoginState> get state => _stateController.stream;

  LoginBloc() {
    _stateController.add(InitialState());
  }

  void handleEvent(LoginEvent event) {
    _login(event.email, event.password);
  }

  Future <void> _login(String email, String password) async {
    final loginResult = LoginService.loginService(email, password);
    try{
      await loginResult.then((value) {
        mess = value.message;
        // print(value.message);
      });
    }catch(e){
      mess = 'failed to get data';
    }

    if (mess == null) {
      _stateController.add(SuccessLoginState(true));
    } else {
      _stateController.add(ErrorLoginState('BLoc Error'));
    }
  }

  void dispose() {
    _stateController.close();
  }
}