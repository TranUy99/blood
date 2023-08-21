import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';
import 'package:mobile_store/src/core/remote/request/category_filter_request/category_filter_request.dart';

import '../../../core/remote/response/product_filter_response/category_filter_response.dart';

class CategoryFilterService {
  Future<CategoryFilterResponse> categoryFilterService(
      int? manufacturerId,
      int? categoryId,
      String? keyword,
      int? lowerPrice,
      int? higherPrice,
      int no,
      int limit) async {
    CategoryFilterResponse categoryFilterResponse = await ApiService(dio.Dio())
        .productCategoryFilter(
            CategoryFilterRequest(
                manufacturerId, categoryId, keyword, lowerPrice, higherPrice),
            no,
            limit);
    return categoryFilterResponse;
  }
}
