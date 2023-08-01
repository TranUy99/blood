import 'dart:async';

import 'package:mobile_store/src/features/login/bloc/login_event.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../main.dart';
import '../service/login_service.dart';
import 'login_state.dart';

SuccessLoginState successLoginState = SuccessLoginState(false, false);

class LoginBloc {
  final _stateController = BehaviorSubject<LoginState>();
  String? message;
  bool verifiedStatus = false;
  int? id;
  String? error;
  Stream<LoginState> get state => _stateController.stream;

  //Get event login
  Future<void> handleEvent(LoginEvent event) async {
    await _login(event.email, event.password, event.isRemember);
  }

  //Call api and get data user
  Future<void> _login(String email, String password, bool? isRemember) async {


    final loginResult = LoginService.loginService(email, password);
    try {
      await loginResult.then((value) {
        message = value.message;
        error = value.error;
        getUser.idUser = value.idUser!;
        getUser.token = value.token;
        getUser.email = email;
        getUser.password = password;
        getUser.isRemember = isRemember;
      });
    } catch (e) {
      error = '$e';
    }
    print('${getUser.email} - ${getUser.idUser} - ${getUser.password} - ${getUser.token}');
    try {
      getUser.userDTO = await UserService.userService(getUser.idUser!, getUser.token!);
      verifiedStatus = (getUser.userDTO.statusDTO)!;
    } catch (e) {
      error = '$e';
    }

    if (error == null) {
      if (verifiedStatus) {
        _stateController.add(successLoginState = SuccessLoginState(true, true));
      } else {
        _stateController.add(successLoginState = SuccessLoginState(false, false));
      }
      successLoginState.saveLoginState(getUser.email, getUser.password,
          getUser.token, getUser.idUser, getUser.isRemember);
    } else {
      _stateController.add(ErrorLoginState(error!));
    }
  }

  void dispose() {
    _stateController.close();
  }
}
