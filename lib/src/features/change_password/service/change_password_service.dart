
import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/main.dart';
import 'package:mobile_store/src/api/api_service.dart';

import 'package:mobile_store/src/core/remote/response/change_password_response/change_password_response.dart';

import '../../../core/remote/request/change_password_request/change_password_request.dart';

class ChangePasswordService {

  //call api change password
  static Future<ChangePasswordResponse> changePassword(
      String oldPassword, String newPassword) async {
    ChangePasswordResponse response = await ApiService(dio.Dio()).changePassword(
        auth: "Bearer ${getUser.token!}",
        changePassword: ChangePasswordRequest(newPassword: newPassword, oldPassword: oldPassword));

    return response;
  }
}
