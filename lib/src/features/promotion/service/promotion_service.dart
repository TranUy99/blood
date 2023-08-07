import 'package:dio/dio.dart';
import 'package:mobile_store/src/core/remote/response/promotion_response/promotion_response.dart';

import '../../../../main.dart';
import '../../../api/api_service.dart';

class PromotionService {
  static Future<PromotionResponse> getPromotionService(int? no, int? limit) async {
    
    PromotionResponse response = await ApiService(Dio()).getPromotion("Bearer ${getUser.token}", no, limit);
   
    return response;
  }
}
