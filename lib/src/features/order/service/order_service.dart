
import 'package:dio/dio.dart';
import 'package:mobile_store/src/core/remote/response/order_response/order_response.dart';
import '../../../../main.dart';
import '../../../api/api_service.dart';
import '../../../core/model/order_detail.dart';

class OrderService {
  // get order
  static Future<OrderResponse> getOrderService(int? no, int? limit) async {
    OrderResponse response = await ApiService(Dio()).getOrder("Bearer ${getUser.token}", no, limit);

    return response;
  }

//get order detail
  static Future<OrderDetailDTO> getOrderDetailService(int? id) async {
    OrderDetailDTO response = await ApiService(Dio()).getOrderDetail("Bearer ${getUser.token}", id);

    return response;
  }
}
