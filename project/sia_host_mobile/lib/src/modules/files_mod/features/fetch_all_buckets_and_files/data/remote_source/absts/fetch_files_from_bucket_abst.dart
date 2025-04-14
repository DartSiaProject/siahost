abstract class FetchFilesFromBucketAbst {
  Future<Map<String, dynamic>> fetchAllFilesOfBucket({
    required String serverAddress,
    // required String password,
    required String bucketName,
    required String prefixPath,
    required String key,
    required String iv,
  });
}
