abstract class FetchAllBucketsAbst {
  Future<Map<String, dynamic>> fetchListOfBucket({
    required String serverAddress,
    // required String password,
    required String key,
    required String iv,
  });
}
