class ApiImage {
  String generateImageUrl(String fileName) {
<<<<<<< HEAD
    String baseUrl = 'http://192.168.1.38:8085/api/file/download/';
=======
    String baseUrl = 'http://192.168.1.2:8085/api/file/download/';
>>>>>>> 4df6c734f2516f62f5042b32d19efdc20035ed03
    String encodedFileName = Uri.encodeComponent(fileName);
    return baseUrl + encodedFileName;
  }
}
