abstract class DownloadTheFileAbst {
  Future<Map<String, dynamic>> downloadTheFile({
    required String serverAddress,
    required String password,
    required String fileName,
    required String bucketName,
  });
}
