import 'package:dio/dio.dart';
import 'package:mobile_store/src/core/remote/response/order_response/order_response.dart';

import '../../../../main.dart';
import '../../../api/api_service.dart';

class OrderService {
  
  static Future<OrderResponse> getOrderService(int? no, int? limit) async {
    OrderResponse response = await ApiService(Dio()).getOrder("Bearer ${getUser.token}", no, limit);

    return response;
  }
}
