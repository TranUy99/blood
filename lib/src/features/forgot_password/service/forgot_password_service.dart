import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';
import 'package:mobile_store/src/core/remote/request/forgot_password_request/forgot_password_request.dart';
import 'package:mobile_store/src/core/remote/response/forgot_password_response/send_email_forgot_password_response.dart';

import '../../../core/remote/response/forgot_password_response/forgot_password_response.dart';

class ForgotPasswordService {
  Future<SendEmailForgotPasswordResponse> sendEmailForgotPasswordService(
      String email) async {
    SendEmailForgotPasswordResponse sendEmailForgotPasswordResponse =
        await ApiService(dio.Dio()).sendEmailForgotPassword(email);
    return sendEmailForgotPasswordResponse;
  }

  Future<ForgotPasswordResponse> forgotPasswordService(
      String newPassword, String otp) async {
    ForgotPasswordResponse forgotPasswordResult = await ApiService(dio.Dio())
        .forgotPassword(ForgotPasswordRequest(newPassword, otp));
    return forgotPasswordResult;
  }
}
