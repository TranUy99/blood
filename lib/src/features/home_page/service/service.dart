import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/core/model/product.dart';
import '../../../api/api_service.dart';

class ProductService {
  Future<List<ProductDTO>> getProductService() async {
    List<ProductDTO> response = await ApiService(dio.Dio()).getProductNew();
    if (response.isNotEmpty) {
      return response;
    } else {
      throw Exception('Failed to load products');
    }
  }
}