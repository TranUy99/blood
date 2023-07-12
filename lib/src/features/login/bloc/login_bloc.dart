import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/src/constant/utils/validate.dart';
import 'package:mobile_store/src/features/login/bloc/login_event.dart';
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
    print(mess);

    if(mess == null){
      _loginStreamController.add(SuccessLoginState(true));
      SuccessLoginState.saveLoginState(email, password, token, id);
    }else{
      _loginStreamController.add(ErrorLoginState(mess!));
    }
  }

  void dispose() {
    _loginStreamController.close();
  }
}
