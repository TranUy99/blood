import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/core/model/user.dart';
import 'package:mobile_store/src/core/remote/request/address_request/address_change_request.dart';
import 'package:mobile_store/src/core/remote/request/change_password_request/change_password_request.dart';
import 'package:mobile_store/src/core/remote/request/login_request/login_request.dart';
import 'package:mobile_store/src/core/remote/response/address_response/address_response.dart';

import 'package:mobile_store/src/core/remote/response/login_response/login_response.dart';
import 'package:mobile_store/src/core/remote/response/product_filter_response/category_filter_response.dart';
import 'package:mobile_store/src/core/remote/response/product_filter_response/manufacturer_filter_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../core/remote/request/address_request/address_create_request.dart';
import '../core/remote/request/sign_up_request/sign_up_request.dart';
import '../core/remote/response/active_otp_response/active_otp_response.dart';
import '../core/remote/response/active_otp_response/send_email_response.dart';
import '../core/remote/response/change_password_response/change_password_response.dart';
import '../core/remote/response/sign_up_response/sign_up_response.dart';

part 'api_service.g.dart';

//Base address
<<<<<<< HEAD
@RestApi(baseUrl: 'http://192.168.1.30:8085')
=======
@RestApi(baseUrl: 'http://192.168.1.21:8085')
>>>>>>> 760c2f9a061d3a7898216cc3db95292baa0ecbf8
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

  //Call api getUser to get user information after login
  @GET('/api/user/{id}')
  Future<UserDTO> getUser(
      {@Header("Authorization") required String auth, @Path('id') required int id});

  //Verified email and password to login
  @POST('/api/login')
  Future<LoginResponse> login(@Body() LoginRequest login);

  //Register new customer
  @POST('/api/user/')
  Future<SignUpResponse> register(@Body() SignUpRequest register);

  @GET('/api/product/new')
  Future<List<ProductDTO>> getProductNew();

  //Get all information about product
  @GET('/api/product/detail/{id}')
  Future<ProductDTO> getDetailProduct(@Path('id') int id);

  //Call this api to send otp via email to active
  @GET('/api/mail/active-user')
  Future<SendEmailResponse> sendEmail(@Query('email') String email);

  //Verify whether the OTP matches the one sent to the email
  @GET('/api/user/active-otp')
  Future<ActiveOTPResponse> activeOTP(@Query('activeOTP') String activeOTP);

  //Call Api to change password
  @PUT('/api/user/change-password-by-token')
  Future<ChangePasswordResponse> changePassword({
    @Header("Authorization") required String auth,
    @Body() required ChangePasswordRequest changePassword,
  });

  // Call api create address
  @POST('/api/address')
  Future<AddressResponse> createAddress({
    @Header("Authorization") required String auth,
    @Body() required AddressCreateRequest createAddress,
  });

  // Call api  get address
  @GET('/api/address')
  Future<List<Address>> getAddress({
    @Header("Authorization") required String auth,
  });

  // call api put address
  @PUT('/api/address')
  Future<AddressResponse> changeAddress({
    @Header("Authorization") required String auth,
    @Body() required AddressChangeRequest createAddress,
  });

  //call api delete address
  @PUT('/api/address/{id}')
  Future<AddressResponse> deleteAddress({
    @Header("Authorization") required String auth,
    @Path("id") required int id,
  });

  //Filter product by manufactureId
  @GET('/api/product/active-filter/{manufacturerId}')
  Future<ManufacturerFilterResponse> productManufacturerFilter(
      @Path('manufacturerId') int manufacturerId, @Query('no') int no, @Query('limit') int limit);

  // //Filter product by categoryId
  @GET('/api/product/active-category/{categoryId}')
  Future<CategoryFilterResponse> productCategoryFilter(
      @Path('categoryId') int categoryId, @Query('no') int no, @Query('limit') int limit);
}
