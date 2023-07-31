import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';

import '../../../core/remote/response/active_otp_response/active_otp_response.dart';
import '../../../core/remote/response/active_otp_response/send_email_response.dart';

//Call Api sendEmail and activeOTP
class VerifiedEmailService {
  static Future<SendEmailResponse> sendEmailService(String email) async {
    SendEmailResponse sendEmailResponse =
        await ApiService(dio.Dio()).sendEmail(email);
    return sendEmailResponse;
  }

  static Future<ActiveOTPResponse> activeOTPService(String activeOTP) async {
    ActiveOTPResponse activeOTPResponse =
        await ApiService(dio.Dio()).activeOTP(activeOTP);
    return activeOTPResponse;
  }
}
