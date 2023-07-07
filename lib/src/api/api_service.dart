import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_store/src/core/model/user.dart';
import 'package:mobile_store/src/core/remote/request/login_request.dart';

import 'package:mobile_store/src/core/remote/response/login_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';



part 'api_service.g.dart';

 // @RestApi(baseUrl: 'http://192.168.1.35:8085')
 @RestApi(baseUrl: 'http://45.117.170.206:8085')

abstract class ApiService {
  factory ApiService(Dio dio) {
    dio.options = BaseOptions(
        validateStatus: (status) => true,
        sendTimeout: const Duration(milliseconds: 5000),
        receiveTimeout:const Duration(milliseconds: 5000),
        connectTimeout: const Duration(milliseconds: 5000),
        receiveDataWhenStatusError: true,
        contentType: 'application/json',
        headers: {'Content-Type': 'application/json'});
    return _ApiService(dio);
  }

  @GET('/api/user/{username}')
  Future<UserDTO> getUser(@Path('username') String username);

  @POST('/api/login')
  Future<LoginResponse> login(@Body() LoginRequest login);
}

