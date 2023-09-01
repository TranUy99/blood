import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';

import '../../../core/remote/response/category_response/category_items_response.dart';

class GetCategoryService {
  Future<CategoryItemsResponse> getCategoryService(int no, int limit) async {
    CategoryItemsResponse _categoryItemsResponse =
        await ApiService(dio.Dio()).getCategory(no, limit);
    return _categoryItemsResponse;
  }
}
