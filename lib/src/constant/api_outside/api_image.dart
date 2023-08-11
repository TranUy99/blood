class ApiImage {
  String generateImageUrl(String fileName) {
<<<<<<< HEAD
    String baseUrl = 'http://192.168.1.4:8085/api/file/download/';
=======
    String baseUrl = 'http://10.5.50.4:8085/api/file/download/';
>>>>>>> 6e837e5713cc9d5cd489d550210e3a34848be9ff
    String encodedFileName = Uri.encodeComponent(fileName);
    return baseUrl + encodedFileName;
  }
}
