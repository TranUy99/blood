class ApiImage {
  String generateImageUrl(String fileName) {
    String baseUrl = 'http://192.168.1.42:8085/api/file/download/';
    String encodedFileName = Uri.encodeComponent(fileName);
    return baseUrl + encodedFileName;
  }
}
