import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';
import 'package:mobile_store/src/core/remote/response/product_filter_response/product_filter_response.dart';

class CategoryService {
  Future<ProductFilterResponse> categoryService(
      int manufacturerId, int no, int limit) async {
    ProductFilterResponse productFilter =
        await ApiService(dio.Dio()).productFilter(manufacturerId, no, limit);
    return productFilter;
  }
}