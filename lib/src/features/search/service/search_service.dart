import 'dart:developer';

import 'package:mobile_store/src/core/model/product.dart';
import 'package:dio/dio.dart';
import '../../../api/api_service.dart';

class SearchService {
  static Future<List<ProductDTO>> getSearchService(String keyword) async {
    List<ProductDTO> response = await ApiService(Dio()).searchNameProduct(keyword);
    response.forEach((response) {});
  
    return response;
  }
}
