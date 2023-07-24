import 'package:mobile_store/src/core/model/user.dart';

class GetUser {
  int? _idUser = 0;
  String? _token = '';
  UserDTO _userDTO = UserDTO();

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
