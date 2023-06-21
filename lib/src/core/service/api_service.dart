import 'package:dio/dio.dart';
import 'package:mobile_store/src/core/model/user.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

 @RestApi(baseUrl: 'http://192.168.1.35:8085')

abstract class ApiService {
  factory ApiService(Dio dio) {
    dio.options = BaseOptions(
        validateStatus: (status) => true,
        sendTimeout: const Duration(microseconds: 5000),
        receiveTimeout:const Duration(microseconds: 5000),
        connectTimeout: const Duration(microseconds: 5000),
        receiveDataWhenStatusError: true,
        contentType: 'application/json',
        headers: {'Content-Type': 'application/json'});
    return _ApiService(dio);
  }

  @GET('/api/user/{username}')
  Future<UserDTO> getUser(@Path('username') String username);
}

