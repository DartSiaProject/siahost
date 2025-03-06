abstract class DeleteTheFileAbst {
  Future<Map<String, dynamic>> deleteTheFile({
    required String serverAddress,
    // required String password,
    required String fileName,
    required String bucketName,
    required String key,
    required String iv,
  });
}
