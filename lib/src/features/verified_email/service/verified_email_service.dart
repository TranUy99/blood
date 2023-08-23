import 'package:retrofit/dio.dart';

import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';

import '../../../core/remote/response/active_otp_response/send_email_active_user_response.dart';

//Call Api sendEmail and activeOTP
class VerifiedEmailService {
  static Future<SendEmailActiveUserResponse> sendEmailService(String email) async {
    SendEmailActiveUserResponse sendEmailResponse =
        await ApiService(dio.Dio()).sendEmailActiveUser(email);
    return sendEmailResponse;
  }

  static Future<String?> activeOTPService(String activeOTP) async {
    HttpResponse httpResponse = await ApiService(dio.Dio()).activeOTP(activeOTP);
    return httpResponse.data.toString();
  }
}
