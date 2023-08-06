class ApiImage {
  String generateImageUrl(String fileName) {
    String baseUrl = 'http://192.168.1.13:8085/api/file/download/';
    String encodedFileName = Uri.encodeComponent(fileName);
    return baseUrl + encodedFileName;
  }
}
