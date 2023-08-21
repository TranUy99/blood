import 'dart:math';

import 'package:dio/dio.dart';
import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/core/model/user.dart';
import 'package:mobile_store/src/core/remote/request/address_request/address_change_request.dart';
import 'package:mobile_store/src/core/remote/request/change_information_request/change_information_request.dart';
import 'package:mobile_store/src/core/remote/request/change_password_request/change_password_request.dart';
import 'package:mobile_store/src/core/remote/request/login_request/login_request.dart';
import 'package:mobile_store/src/core/remote/request/review_request/create_review_request.dart';
import 'package:mobile_store/src/core/remote/request/review_request/edit_review_request.dart';
import 'package:mobile_store/src/core/remote/response/address_response/address_response.dart';
import 'package:mobile_store/src/core/remote/response/category_response/manufacturer_items_response.dart';
import 'package:mobile_store/src/core/remote/response/login_response/login_response.dart';
import 'package:mobile_store/src/core/remote/response/product_filter_response/category_filter_response.dart';
import 'package:mobile_store/src/core/remote/response/promotion_response/promotion_response.dart';
import 'package:mobile_store/src/core/remote/response/review_response/edit_review_response.dart';
import 'package:mobile_store/src/core/remote/response/search_response/search_response.dart';
import 'package:retrofit/retrofit.dart';

import '../core/model/order_detail.dart';
import '../core/model/review_dtos.dart';
import '../core/remote/request/address_request/address_create_request.dart';
import '../core/remote/request/forgot_password_request/forgot_password_request.dart';
import '../core/remote/request/order_request/order_request.dart';
import '../core/remote/request/sign_up_request/sign_up_request.dart';
import '../core/remote/response/active_otp_response/active_otp_response.dart';
import '../core/remote/response/active_otp_response/send_email_active_user_response.dart';
import '../core/remote/response/category_response/category_items_response.dart';
import '../core/remote/response/change_password_response/change_password_response.dart';
import '../core/remote/response/forgot_password_response/forgot_password_response.dart';
import '../core/remote/response/forgot_password_response/send_email_forgot_password_response.dart';
import '../core/remote/response/order_response/order_response.dart';
import '../core/remote/response/review_response/create_review_response.dart';
import '../core/remote/response/review_response/review_response.dart';
import '../core/remote/response/sign_up_response/sign_up_response.dart';

part 'api_service.g.dart';

<<<<<<< HEAD
@RestApi(baseUrl: 'http://45.117.170.206:60/apis')
abstract class ApiService {
  // static const String baseUrl = 'http://192.168.1.42:8085/api';
=======
//Base address
@RestApi(baseUrl: 'http://45.117.170.206:60/apis')
// @RestApi(baseUrl: 'http://45.117.170.206:8085')

abstract class ApiService {

>>>>>>> 09ea1a93d0a2cfbcbc98b14e24612b50e33346ed
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
  @GET('/user/{id}')
  Future<UserDTO> getUser(
      {@Header("Authorization") required String auth, @Path('id') required int id});

  //Verified email and password to login
  @POST('/login')
  Future<LoginResponse> login(@Body() LoginRequest login);

  //Register new customer
  @POST('/user/')
  Future<SignUpResponse> register(@Body() SignUpRequest register);

  //get new product
  @GET('/product/new')
  Future<List<ProductDTO>> getProductNew();

  //Get all information about product
  @GET('/product/detail/{id}')
  Future<ProductDTO> getDetailProduct(@Path('id') int id);

  //search product with namme
  @GET('/product/search-product')
  Future<SearchResponse> searchNameProduct(
      @Query('keyword') String? keyword, @Query('no') int? no, @Query('limit') int? limit);

  //Call this api to send otp via email to active
  @GET('/mail/active-user')
  Future<SendEmailActiveUserResponse> sendEmailActiveUser(@Query('email') String email);

  //Verify whether the OTP matches the one sent to the email
  @GET('/user/active-otp')
  Future<ActiveOTPResponse> activeOTP(@Query('activeOTP') String activeOTP);

  //Call Api to change password
  @PUT('/user/change-password-by-token')
  Future<ChangePasswordResponse> changePassword({
    @Header("Authorization") required String auth,
    @Body() required ChangePasswordRequest changePassword,
  });

  // Call api  get address
  @GET('/address')
  Future<List<Address>> getAddress({
    @Header("Authorization") required String auth,
  });

  // Call api  get address
  @GET('/address/{id}')
  Future<Address> getIdAddress({
    @Header("Authorization") required String auth,
    @Path("id") required int? id,
  });


  // Call api create address
  @POST('/address')
  Future<AddressResponse> createAddress({
    @Header("Authorization") required String auth,
    @Body() required AddressCreateRequest createAddress,
  });

  //call api change address
  @PUT('/address/update-address/{id}')
  Future<AddressResponse> changeAddress({
    @Header("Authorization") required String auth,
    @Path("id") required int? id,
    @Body() required AddressChangeRequest changeAddress,
  });

  //call api change address
  @DELETE('/address/{id}')
  Future<HttpResponse> deleteAddress({
    @Header("Authorization") required String auth,
    @Path("id") required int? id,
  });

  //Get promotion
  @GET('/promotion')
  Future<PromotionResponse> getPromotion(
      @Header("Authorization") String auth, @Query('no') int? no, @Query('limit') int? limit);

  @GET('/product/filter-product')
  Future<CategoryFilterResponse> productCategoryFilter(@Query('manufacturerId') int? manufacturerId,
      @Query('categoryId') int categoryId, @Query('no') int no, @Query('limit') int limit);

  @GET('/categories')
  Future<CategoryItemsResponse> getCategory(@Query('no') int no, @Query('limit') int limit);

  @GET('/manufacturer')
  Future<ManufacturerItemsResponse> getManufacturer(@Query('no') int no, @Query('limit') int limit);

  @GET('/mail/forgot-password/{email}')
  Future<SendEmailForgotPasswordResponse> sendEmailForgotPassword(@Path('email') String email);

  @POST('/user/change-password-by-otp')
  Future<ForgotPasswordResponse> forgotPassword(
      @Body() ForgotPasswordRequest forgotPasswordRequest);

  @PUT('/user/{id}')
  Future<UserDTO> changeInformationUser(@Path('id') int userId,
      @Header("Authorization") String auth, @Body() ChangeInformationRequest changeInformation);
//get order
  @GET('/order/user')
  Future<OrderResponse> getOrder(
      @Header("Authorization") String auth, @Query('no') int? no, @Query('limit') int? limit);
//get order detail
  @GET('/order/user/detail/{id}')
  Future<OrderDetailDTO> getOrderDetail(
      @Header("Authorization") String auth,
      @Path("id") int? id,
      );

  //get order detail
  @GET('/order')
  Future<HttpResponse> createOrder(
<<<<<<< HEAD
    @Header("Authorization") String auth,
    @Body() OrderRequest orderRequest,
  );
  //create review
=======
      @Header("Authorization") String auth,
      @Body() OrderRequest orderRequest,
      );


>>>>>>> 09ea1a93d0a2cfbcbc98b14e24612b50e33346ed
  @POST('/review')
  Future<CreateReviewResponse> createReview(
      @Header("Authorization") String auth, @Body() CreateReviewRequest createReviewRequest);
//edit review
  @PUT('/review/{reviewID}')
  Future<EditReviewResponse> editReview(@Path('reviewID') int reviewID,
      @Header("Authorization") String auth, @Body() EditReviewRequest editReviewRequest);

  @GET('/review/{manufacturerID}')
  Future<ReviewResponse> getReview(
      @Path('manufacturerID') int manufacturerID, @Query('no') int no, @Query('limit') int limit);

//get related product
  @GET('/product/related-product')
  Future<List<ProductDTO>> getRelatedProduct(
      @Query('productId') int productId, @Query('quantity') int quantity);
}

