import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile_store/src/core/model/user.dart';

class GetUser {
  int? _idUser;
  String? _token;
  String? _password;
  String? _email;
  UserDTO _userDTO = UserDTO();
  bool? _isRemember;
  Box? _cartBox;

  Box? get cartBox => _cartBox;

  set cartBox(Box? value) {
    _cartBox = value;
  }

  bool? get isRemember => _isRemember;

  set isRemember(bool? value) {
    _isRemember = value;
  }

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get password => _password;

  set password(String? value) {
    _password = value;
  }

  UserDTO get userDTO => _userDTO;

  set userDTO(UserDTO value) {
    _userDTO = value;
  }

  String? get token => _token;

  set token(String? value) {
    _token = value;
  }

  int? get idUser => _idUser;

  set idUser(int? value) {
    _idUser = value;
  }
}
