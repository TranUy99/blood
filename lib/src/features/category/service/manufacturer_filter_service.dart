import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';
import 'package:mobile_store/src/core/remote/response/product_filter_response/manufacturer_filter_response.dart';

class ManufacturerFilterService {
  Future<ManufacturerFilterResponse> manufacturerFilterService(
      int manufacturerId, int no, int limit) async {
    ManufacturerFilterResponse manufacturerFilterResponse =
        await ApiService(dio.Dio())
            .productManufacturerFilter(manufacturerId, no, limit);
    return manufacturerFilterResponse;
  }
}
