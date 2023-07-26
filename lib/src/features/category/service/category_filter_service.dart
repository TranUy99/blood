import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';

import '../../../core/remote/response/product_filter_response/category_filter_response.dart';

class CategoryFilterService {
  Future<CategoryFilterResponse> categoryFilterService(
      int categoryId, int no, int limit) async {
    CategoryFilterResponse categoryFilterResponse = await ApiService(dio.Dio())
        .productCategoryFilter(categoryId, no, limit);
    return categoryFilterResponse;
  }
}
