import 'package:dio/dio.dart';
import 'package:mobile_store/src/core/model/product.dart';
import '../../../api/api_service.dart';

//get product with api
class ProductService {
  static Future<List<ProductDTO>> getProductService() async {
    List<ProductDTO> response = await ApiService(Dio()).getProductNew();
    response.forEach((response) {});

    return response;
  }
}
