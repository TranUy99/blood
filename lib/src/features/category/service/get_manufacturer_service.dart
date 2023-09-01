import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';

import '../../../core/remote/response/category_response/manufacturer_items_response.dart';

class GetManufacturerService {
  Future<ManufacturerItemsResponse> getManufacturerService(int no, int limit) async {
    ManufacturerItemsResponse _manufacturerItemsResponse =
    await ApiService(dio.Dio()).getManufacturer(no, limit);
    return _manufacturerItemsResponse;
  }
}