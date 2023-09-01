
import 'package:dio/dio.dart';
import 'package:mobile_store/src/api/api_service.dart';
import 'package:mobile_store/src/core/remote/request/order_request/order_request.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../main.dart';
import '../../../core/model/order_product_dto.dart';
import '../../../core/model/status_dto.dart';

class CheckOutService {
  static Future<HttpResponse> checkOutService(
      int? idUser,
      int? idPromotion,
      String? paymentMethodDTO,
      StatusDTO? statusDTO,
      List<OrderProductDTO?> orderProductDTOList,
      int? idAddress,
      String? receiveDate) async {
    HttpResponse response = await ApiService(Dio()).createOrder(
      auth: 'Bearer ${getUser.token}',
      orderRequest: OrderRequest(
        idUser,
        idPromotion,
        paymentMethodDTO,
        statusDTO,
        orderProductDTOList,
        idAddress,
        receiveDate,
      ),
      
    );
    
    return response;
  }
}
