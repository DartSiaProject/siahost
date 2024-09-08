abstract class RenameTheFileAbst {
  Future<Map<String, dynamic>> renameTheFile({
    required String serverAddress,
    // required String password,
    required String bucketName,
    required String oldFileName,
    required String newFileName,
    required String key,
    required String iv,
  });
}
