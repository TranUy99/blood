
import 'package:dio/dio.dart';
import 'package:mobile_store/src/core/remote/response/search_response/search_response.dart';
import '../../../api/api_service.dart';

class SearchService {
  static Future<SearchResponse> getSearchService(String? keyword, int? no, int? limit) async {
  
 
    SearchResponse response = await ApiService(Dio()).searchNameProduct(keyword, no, limit);

    return response;
  }
}
