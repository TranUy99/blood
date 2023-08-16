import 'package:mobile_store/src/api/api_service.dart';

class ApiImage {
  String generateImageUrl(String fileName) {
    String baseUrl = '${ApiService.baseUrl}/file/download/';
    String encodedFileName = Uri.encodeComponent(fileName);
    return baseUrl + encodedFileName;
  }
}
