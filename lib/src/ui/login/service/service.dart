import 'package:dio/dio.dart' as dio;

import '../../../core/service/api_service.dart';
import '../view_model/login_request.dart';
import '../view_model/login_response.dart';

class LoginService{
  Future<List<String?>> loginService(String? email, String? password) async {
    LoginResponse loginResponse = await ApiService(dio.Dio()).login(LoginRequest(
      email: email,
      password: password,
    ));
    return [loginResponse.email, loginResponse.idUser.toString(), loginResponse.token];
  }
}