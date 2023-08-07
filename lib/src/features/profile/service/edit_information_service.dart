import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';
import 'package:mobile_store/src/core/remote/request/change_information_request/change_information_request.dart';

import '../../../core/model/user.dart';

class EditInformationService {
  Future<UserDTO> editInformationService(int? userId, String? token,
      String? email, String? fullName, int? gender, String? birthDay) async {
    UserDTO editInformation = await ApiService(dio.Dio()).changeInformationUser(
        userId!,
        'Bearer $token',
        ChangeInformationRequest(email, fullName, gender, birthDay));
    return editInformation;
  }
}
