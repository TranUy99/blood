import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';
import 'package:mobile_store/src/core/remote/response/forgot_password_response/send_email_forgot_password_response.dart';

class ForgotPasswordService {
  Future<SendEmailForgotPasswordResponse> sendEmailForgotPasswordService(
      String email) async {
    SendEmailForgotPasswordResponse sendEmailForgotPasswordResponse =
        await ApiService(dio.Dio()).sendEmailForgotPassword(email);
    return sendEmailForgotPasswordResponse;
  }
}
