class ApiImage {
  String generateImageUrl(String fileName) {
    String baseUrl = 'http://172.19.201.197:8085/api/file/download/';
    String encodedFileName = Uri.encodeComponent(fileName);
    return baseUrl + encodedFileName;
  }
}
