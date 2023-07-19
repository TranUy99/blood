import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/core/model/user.dart';

import 'package:mobile_store/src/core/remote/request/login_request/login_request.dart';
import 'package:mobile_store/src/core/remote/response/login_response/login_response.dart';

import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../core/remote/request/sign_up_request/sign_up_request.dart';
import '../core/remote/response/active_otp_response/active_otp_response.dart';
import '../core/remote/response/active_otp_response/send_email_response.dart';
import '../core/remote/response/sign_up_response/sign_up_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://192.168.1.11:8085')
// @RestApi(baseUrl: 'http://45.117.170.206:8085')

abstract class ApiService {
  factory ApiService(Dio dio) {
    dio.options = BaseOptions(
        validateStatus: (status) => true,
        sendTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
        connectTimeout: const Duration(milliseconds: 5000),
        receiveDataWhenStatusError: true,
        contentType: 'application/json',
        headers: {'Content-Type': 'application/json'});
    return _ApiService(dio);
  }

  @GET('/api/user/{id}')
  Future<UserDTO> getUser(
      {@Header("Authorization") required String auth, @Path('id') required int id});

  @POST('/api/login')
  Future<LoginResponse> login(@Body() LoginRequest login);

  @POST('/api/user/')
  Future<SignUpResponse> register(@Body() SignUpRequest register);

  @GET('/api/product')
  Future<List<ProductDTO>> getProductNew();

  @GET('/api/product/detail/{id}')
  Future<ProductDTO> getDetailProduct(@Path('id') int id);

  @GET('/api/mail/active-user')
  Future<SendEmailResponse> sendEmail(@Query('email') String email);

  @GET('/api/user/active-otp')
  Future<ActiveOTPResponse> activeOTP(@Query('activeOTP') String activeOTP);
  
}
