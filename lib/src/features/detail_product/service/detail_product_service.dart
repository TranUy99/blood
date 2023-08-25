

import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/core/model/product.dart';

import '../../../api/api_service.dart';

//Get api product
class DetailProductService {
  static Future<ProductDTO> getDetailProductService(int idProduct) async {
    ProductDTO response = await ApiService(dio.Dio()).getDetailProduct(idProduct);

    return response;
  }

  static Future<List<ProductDTO>> getRelatedProductService(int idProduct) async {
    List<ProductDTO> response = await ApiService(dio.Dio()).getRelatedProduct(idProduct, 6);
   
    return response;
  }
}
