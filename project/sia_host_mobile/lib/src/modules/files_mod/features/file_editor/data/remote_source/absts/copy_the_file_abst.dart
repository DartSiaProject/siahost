abstract class CopyTheFileAbst {
  Future<Map<String, dynamic>> copyAndPasteTheFile({
    required String serverAddress,
    required String password,
    required String sourceBucketName,
    required String sourcefileName,
    required String destBucketName,
    required String destfileName,
  });
}
