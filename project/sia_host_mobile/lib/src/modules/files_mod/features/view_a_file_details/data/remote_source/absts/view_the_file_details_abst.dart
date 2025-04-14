abstract class ViewTheFileDetailsAbst {
  Future<Map<String, dynamic>> viewTheDetailsFile({
    required String serverAddress,
    // required String password,
    required String fileName,
    required String bucketName,
    required String key,
    required String iv,
  });
}
