import 'package:mobile_store/src/api/api_service.dart';

class ApiImage {
  String generateImageUrl(String fileName) {
    String baseUrl = 'http://45.117.170.206:60/apis/file/download/';
    String encodedFileName = Uri.encodeComponent(fileName);
    return baseUrl + encodedFileName;
  }
}

