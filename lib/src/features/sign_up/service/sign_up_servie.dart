import 'package:dio/dio.dart' as dio;

import '../../../api/api_service.dart';
import '../../../core/remote/request/sign_up_request/sign_up_request.dart';
import '../../../core/remote/response/sign_up_response/sign_up_response.dart';

//Call Api register
class SignUpService {
  static Future<SignUpResponse> signUpService(
      String? email, String? password, String? fullName) async {
    SignUpResponse signUpResponse =
        await ApiService(dio.Dio()).register(SignUpRequest(
      email: email,
      password: password,
      fullName: fullName,
    ));

    return signUpResponse;
  }
}
