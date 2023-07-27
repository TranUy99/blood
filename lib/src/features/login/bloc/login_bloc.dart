import 'dart:async';
import 'dart:developer';

import 'package:mobile_store/src/features/login/bloc/login_event.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../main.dart';
import '../service/login_service.dart';
import 'login_state.dart';

SuccessLoginState successLoginState = SuccessLoginState(false, false);

class LoginBloc {
  final _stateController = BehaviorSubject<LoginState>();
  String? mess;
  bool verifiedStatus = false;

  Stream<LoginState> get state => _stateController.stream;

  //Get event login
  Future<void> handleEvent(LoginEvent event) async {
    await _login(event.email, event.password, event.isRemember);
  }

  //Call api and get data user
  Future<void> _login(String email, String password, bool isRemember) async {
    final loginResult = LoginService.loginService(email, password);
    try {
      await loginResult.then((value) {
        mess = value.message;
        getUser.idUser = value.idUser!;
        getUser.token = value.token;
        // print('$id - $token');
      });
    } catch (e) {
      mess = 'e';
    }

    try {
      getUser.userDTO = await UserService.userService(getUser.idUser!, getUser.token!);
      verifiedStatus = (getUser.userDTO.statusDTO)!;
    } catch (e) {
      print(e);
    }
    if (mess == null) {
      if (verifiedStatus) {
        _stateController.add(successLoginState = SuccessLoginState(true, true));
      } else {
        _stateController.add(successLoginState = SuccessLoginState(false, false));
      }
      successLoginState.saveLoginState(email, password, getUser.token, getUser.idUser, isRemember);
    } else {
      _stateController.add(ErrorLoginState(mess!));
    }
  }

  void dispose() {
    _stateController.close();
  }
}
