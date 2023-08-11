import 'package:dio/dio.dart';
import 'package:mobile_store/src/core/remote/response/order_response/order_response.dart';
import 'package:retrofit/dio.dart';

import '../../../../main.dart';
import '../../../api/api_service.dart';

class OrderService {
  
  static Future<OrderResponse> getOrderService(int? no, int? limit) async {
    OrderResponse response = await ApiService(Dio()).getOrder("Bearer ${getUser.token}", no, limit);

    return response;
  }

  static Future<HttpResponse> getOrderDetailService(int? id) async {
    HttpResponse response = await ApiService(Dio()).getOrderDetail("Bearer ${getUser.token}", id);

    return response;
  }
}
